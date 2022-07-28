<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\common\ErrorCode;
use app\common\EventName;
use app\exception\DeviceControlErrorException;
use app\exception\ErrorException;
use app\exception\MessageException;
use app\exception\ValidateException;
use app\model\Device;
use app\model\DeviceControl;
use app\service\DeviceService;
use think\facade\Event;

class DeviceControlLogic extends BaseLogic
{

    /**
     * 操作对应的事件
     * @var array
     */
    protected $controlEventName = [
        DeviceControl::STATE_WAIT         => EventName::DEVICE_WAIT,
        DeviceControl::STATE_START        => EventName::DEVICE_START,
        DeviceControl::STATE_PAUSE        => EventName::DEVICE_PAUSE,
        DeviceControl::STATE_FINISH       => EventName::DEVICE_FINISH,
        DeviceControl::STATE_WAIT_TIMEOUT => EventName::DEVICE_WAIT_TIMEOUT,
    ];

    /**
     * 直接发送事件
     * @var array
     */
    protected $sendEventName = [
        DeviceControl::STATE_START  => EventName::DEVICE_CONTROL_START,
        DeviceControl::STATE_PAUSE  => EventName::DEVICE_CONTROL_PAUSE,
        DeviceControl::STATE_FINISH => EventName::DEVICE_CONTROL_FINISH,
    ];

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return DeviceControl::class;
    }

    /**
     * 检测是否可以操作
     * @param $device
     * @param $state 需要执行的操作
     * @return bool
     * @throws ValidateException
     */
    public function checkCanControl($device, $state, $uid = 0, $switch = false)
    {
        if (!$device) {
            throw new ValidateException('请传入设备');
        }

        $uid = $uid ?: $this->user->uid();

        $deviceID = $device->id;

        $this->checkUserControl($uid, $deviceID, $state);

        $service = new DeviceService();
        $detail  = $service->deviceLastControl($deviceID);

        if (!$detail) return true;

        //设备操作超时
        if ($detail->isTimeout()) {

            $updateState = DeviceControl::STATE_FINISH;

            if ($detail->isWaitState()) {
                $updateState = DeviceControl::STATE_WAIT_TIMEOUT;
            }

            $status = $this->addByDevice($device, $updateState, $detail->user_id);

            return $status->checkUserCanControl($uid, $state, $switch);
        }

        return $detail->checkUserCanControl($uid, $state, $switch);
    }

    /**
     * 检测用户是否在操作其他机器
     * @param $userID
     * @param $deviceID
     * @param $state
     * @throws ValidateException
     */
    public function checkUserControl($userID, $deviceID, $state)
    {
        if ($state === DeviceControl::STATE_START || $state === DeviceControl::STATE_WAIT) {
            $service = new DeviceService();

            $detail = $service->deviceLastControlByUser($userID);

            if ($detail) {
                if ($detail->isTimeout()) {
//                    $detail->deviceFinish();
                } else if (!$detail->isFinishState() && $detail['device_id'] != $deviceID) {
//                    $detail->deviceFinish();
                    throw new DeviceControlErrorException(ErrorCode::USER_HAS_OTHER_DEVICE_CONTROL[1], ErrorCode::USER_HAS_OTHER_DEVICE_CONTROL[0]);
                }

            }
        }
    }

    /**
     * 添加设备控制记录
     * @param $device 设备
     * @param $state 状态
     * @param $uid 用户ID
     * @return \app\model\BaseModel
     * @throws MessageException
     */
    public function addByDevice($device, $state, $uid = 0, $switch = false)
    {
        $eventName = $this->controlEventName[$state] ?? '';
        $uid       = $uid ?: $this->user->uid();

        if ($device->type == Device::EASY_TYPE) {
            $this->checkEasyDeviceState($state);
            $switch = true;
        }

        if (!$eventName) {
            throw new ErrorException("未设置{$state}事件名");
        }

        $isObj = is_object($device) || is_array($device);

        $control = $this->add([
            'device_id' => $isObj ? $device->id : $device,
            'user_id'   => $uid,
            'state'     => $state,
        ]);

        if (!$control) {
            throw new MessageException($state . '状态插入数据库失败');
        }
        if ($isObj) {
            $params = compact('device', 'control', 'switch');
            Event::trigger(EventName::DEVICE_CONTROL, $params);

            //不是需要发送消息的则不触发事件
            if (!in_array($state, array_keys($this->sendEventName))) {
                Event::trigger($eventName, $params);
            }
        }

        return $control;
    }

    /**
     * 直接发送消息而不保存控制数据
     * @param $device
     * @param $state
     * @param int $uid
     * @return DeviceControl
     * @throws ErrorException
     */
    public function sendByDevice($device, $state, $uid = 0, $switch = false)
    {
        $eventName = $this->sendEventName[$state] ?? '';
        $uid       = $uid ?: $this->user->uid();

        if ($device->type == Device::EASY_TYPE) {
            $switch = true;
        }


        //操作启动，先给设置想操作的用户id
//        if ($state == DeviceControl::STATE_START) {
        $service = new DeviceService();
        $service->deviceWantControlUserID($device->device_no, $uid);
        $service->deviceIsSwitch($device->device_no, $switch ? 1 : 0);
//        }

        if (!$eventName) {
            throw new ErrorException("未设置{$state}事件名");
        }

        $control = new DeviceControl([
            'device_id'   => $device->id,
            'user_id'     => $uid,
            'state'       => $state,
            'create_time' => time(),
        ]);

        $params = compact('device', 'control', 'switch');
        Event::trigger($eventName, $params);

        return $control;
    }

    /**
     * 通过控制记录再次执行事件
     * @param $control
     */
    public function sendByControl($control, $switch = false)
    {
        if ($control->device->type == Device::EASY_TYPE) {
            $switch = true;
        }

        if (isset($this->controlEventName[$control->state])) {
            $eventName = $this->controlEventName[$control->state];
            $device    = $control->device;
            $params    = compact('device', 'control', $switch);
            Event::trigger($eventName, $params);
        }
    }

    /**
     * 检测简易设备
     * @param $state
     * @return $this
     * @throws MessageException
     */
    public function checkEasyDeviceState($state)
    {
        if (!in_array($state, [Device::START_STATE, Device::FINISH_STATE])) {
            throw new MessageException('不可操作');
        }

        return $this;
    }
}
