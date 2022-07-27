<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:36
 */

namespace app\logic;


use app\common\Enum;
use app\common\ErrorCode;
use app\common\EventName;
use app\common\Message;
use app\exception\MessageException;
use app\exception\DataNotFoundException;
use app\exception\ParamErrorException;
use app\exception\ValidateException;
use app\job\DeviceTimeoutJob;
use app\model\Device;
use app\model\DeviceControl;
use app\model\Product;
use app\service\DeviceService;
use app\service\user\UserService;
use app\validate\DeviceValidate;
use app\validate\IDMustBeIntArrayValidate;
use think\facade\Event;
use think\facade\Queue;
use think\facade\Request;

class DeviceLogic extends BaseLogic
{
    protected function getModelName()
    {
        return Device::class;
    }

    /**
     * 获取设备
     * @param $deviceNo
     * @return \app\model\BaseModel|array|mixed|\think\Model
     * @throws DataNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getByDeviceNo($deviceNo)
    {
        /**
         * @var $detail Device
         */
        $detail = $this->getModel()->where('device_no', $deviceNo)->cache(30)->find();

        $this->checkDevice($detail);

        return $detail;
    }

    /**
     * 通过ID获取设备
     * @param $id
     * @return Device
     * @throws DataNotFoundException
     * @throws MessageException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getID($id)
    {
        /**
         * @var $detail Device
         */
        $detail = $this->getModel()->cache(30)->find((int)$id);

        $this->checkDevice($detail);

        return $detail;
    }

    public function checkDevice($detail)
    {
        if (!$detail) {
            throw new DataNotFoundException('找不到相关设备');
        }

        if ($detail->isOffStatus()) {
            throw new MessageException(Message::STATUS_OFF, ErrorCode::STATUS_ERROR[0]);
        }

        if ($detail->isFaultStatus()) {
            throw new MessageException(Message::STATUS_FAULT, ErrorCode::STATUS_ERROR[0]);
        }

        if ($detail->isDisabled()) {
            throw new MessageException(Message::STATUS_DISABLED, ErrorCode::STATUS_ERROR[0]);
        }

        return $this;
    }

    public function useState($id = 0)
    {
        IDMustBeIntArrayValidate::batchCheck();

        $result = $this->getAll(['field' => ['id', 'status', 'state'], 'where' => [['id', 'IN', $id]]])->append(['state_desc', 'status_desc']);

        return $result;
    }

    //等待加水
    public function wait($deviceNo = '')
    {
        $this->control($deviceNo, DeviceControl::STATE_WAIT);

        return true;
    }

    //开始加水
    public function start($deviceNo = '', $send = false, $switch = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_START, $send, $switch);

        return true;
    }

    //暂停加水
    public function pause($deviceNo = '', $send = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_PAUSE, $send);

        return true;
    }

    //加水完成
    public function finish($deviceNo = '', $send = false, $switch = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_FINISH, $send, $switch);

        return true;
    }

    public function waitTimeout($deviceNo = '')
    {
        $this->control($deviceNo, DeviceControl::STATE_FINISH);

        return true;
    }

    //设置
    public function setting($deviceNo = '', $params = [])
    {
        $device = $this->getDevice($deviceNo);

        Event::trigger(EventName::DEVICE_SET_QRCODE_URL, compact('device'));
        Event::trigger(EventName::DEVICE_SET_DEVICE_NO, compact('device'));

        $temperature = $this->request->param('temperature', 0, 'intval');

        if ($temperature > 0) {
            Event::trigger(EventName::DEVICE_SET_TEMPERATURE, array_merge(compact('device'), ['num' => $temperature]));
        }

        $pulse = $this->request->param('pulse', $params['pulse'] ?? 0, 'intval');
        if ($pulse > 0) {
            Event::trigger(EventName::DEVICE_SET_PULSE, array_merge(compact('device'), ['num' => $pulse]));
        }
        return true;
    }

    /**
     * 获取使用状态
     * @param string $deviceNo
     * @return array
     */
    public function useing($deviceNo = '')
    {
        $service     = new DeviceService();
        $lastControl = $service->deviceLastControl($deviceNo);
        $user        = $this->user->getUserInfo();
        $userID      = $user->id;

        $isUserControl = false;

        if ($lastControl && $lastControl->user_id == $userID) {
            $isUserControl = true;
        }

        $useFlow = $service->userUseFLow($userID) ?: 0;
        $flow    = $user->flow - $useFlow;

        return [
            'is_user_control' => $isUserControl,
            'flow'            => $user->flow,
            'has_flow'        => $flow,
            'used_flow'       => $useFlow,
            'state'           => $lastControl ? $lastControl->state : DeviceControl::STATE_FINISH,
            'state_key'       => $lastControl ? $lastControl->getStateKey() : DeviceControl::STATE_KEY[DeviceControl::STATE_FINISH],
        ];
    }

    /**
     * 获取设备
     * @param string $deviceNo
     * @return Device
     * @throws \app\exception\ValidateException
     */
    public function getDevice($deviceNo = '')
    {
        if (is_object($deviceNo)) {
            return $deviceNo;
        }

        DeviceValidate::batchCheck(['device_no' => $deviceNo], 'control');

        $device = $this->getByDeviceNo($deviceNo);

        return $device;
    }

    /**
     * 设备上线
     * @param string $imei
     * @return \app\model\BaseModel|array|mixed|\think\Model
     * @throws MessageException
     * @throws ParamErrorException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function online($imei = '', $type = 1)
    {
        if (empty($imei)) {
            throw new ParamErrorException(Message::DEVICE_IMEI_EMPTY);
        }

        $data = $this->getModel()->where('imei', $imei)->find();

        if ($data) {
            $deviceService = new DeviceService();
            $last          = $deviceService->deviceLastControl($data->device_no);

            if ($last && in_array($last->state, [DeviceControl::STATE_WAIT, DeviceControl::STATE_START, DeviceControl::STATE_PAUSE])) {
                if (Request::isCli()) {
                    $date = date('Y-m-d H:i:s');
                    dump("[$date][{$data->device_no}]异常上线，初始化状态并结算");
                }
                $params = ['device' => $data, 'control' => $last];
                Event::trigger(EventName::DEVICE_UPDATE_FLOW, $params);

                Request::setUser(new UserService($last->user, md5(uniqid())));
                $this->finish($data);
            }

            return $data;
        }

        $n = (int)($this->getModel()->max('id') + 1);

        $number = str_pad($n, 6, '0', STR_PAD_LEFT);
        $params = [
            'name'      => $number,
            'device_no' => $number,
            'imei'      => $imei,
            'status'    => Device::STATUS_OFF,
            'type'      => $type,
        ];

        $status = $this->getModel()->add($params);

        if (!$status) {
            throw new MessageException(Message::DEVICE_ONLINE_ERROR);
        }

        return $status;
    }

    /**
     * 控制设备
     * @param string $deviceNo 设备号
     * @param string $state 操作状态
     * @param string $send 只发送消息不改变状态
     * @return bool
     * @throws MessageException
     * @throws \app\exception\ValidateException
     */
    protected function control($deviceNo, $state, $send = false, $switch = false)
    {
        $device       = $this->getDevice($deviceNo);
        $user         = $this->user->getUserInfo();
        $service      = new DeviceService();
        $lastIsSwitch = $state === DeviceControl::STATE_FINISH && $service->deviceIsSwitch($deviceNo);
        $isSwitch     = $device->type === Device::EASY_TYPE || ($user->expire_time > time() || $switch || $lastIsSwitch);
        $this->checkCanControl($device, $state, $isSwitch);

        // 简易设备 或者 用户有剩余时长
        if ($isSwitch) {
            if ($state == Device::START_STATE) {
                $time = $user->expire_time - time();
                // 延时队列 监听到期后是否还在启动
                Queue::later($time, DeviceTimeoutJob::class, ['user_id' => $user->id, 'device_id' => $device->id, 'device_no' => $deviceNo, 'device_type' => $device->type], Enum::JOB_DEVICE_TIMEOUT_CHECK);
            } elseif ($state == Device::FINISH_STATE) {

            }
            $this->sendDeviceControl($device, $state, true);
//            if ($state === DeviceControl::STATE_FINISH) {
            $control = $this->addDeviceControl($device, $state, true);
//            }
            return true;
        }

        if ($send) {
            $this->sendDeviceControl($device, $state);
        } else {
            $control = $this->addDeviceControl($device, $state);
        }
        return true;
    }

    /**
     * 判断是否可以操作
     * @param $device
     * @param $state
     * @return bool
     * @throws \app\exception\ValidateException
     */
    protected function checkCanControl($device, $state, $switch = false)
    {
        $user = $this->user->getUserInfo();

        //没流量或者已过期
        if ($state == DeviceControl::STATE_START) {
            if ($user->flow <= 0 && $user->expire_time <= time()) {
//            throw new MessageException(Message::NO_FLOW);
                throw new MessageException('请先充值再使用');
            }

            // 设备套餐类型为计时需要有加水时长
            if ($device->product_type === Product::TIME_TYPE && $user->expire_time <= time()) {
                throw new MessageException('当前设备为按时计费，加水时长不足，请先充值再使用');
            }
        }

        $logic = new DeviceControlLogic();

        return $logic->checkCanControl($device, $state, 0, $switch);
    }

    /**
     * 添加设备控制日志
     * @param $device
     * @param $state 状态
     * @return \app\model\BaseModel
     * @throws MessageException
     */
    public function addDeviceControl($device, $state, $switch = false)
    {
        $logic = new DeviceControlLogic();

        $status = $logic->addByDevice($device, $state, 0, $switch);

        return $status;
    }

    /**
     * 只发送指令不保存
     * @param $device
     * @param $state
     * @return DeviceControl
     * @throws \app\exception\ErrorException
     */
    public function sendDeviceControl($device, $state, $switch = false)
    {
        $logic = new DeviceControlLogic();

        $status = $logic->sendByDevice($device, $state, 0, $switch);

        return $status;
    }
}
