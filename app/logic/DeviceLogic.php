<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:36
 */

namespace app\logic;


use app\common\ErrorCode;
use app\common\EventName;
use app\common\Message;
use app\exception\MessageException;
use app\exception\DataNotFoundException;
use app\exception\ParamErrorException;
use app\exception\ValidateException;
use app\model\Device;
use app\model\DeviceControl;
use app\service\DeviceService;
use app\validate\DeviceValidate;
use app\validate\IDMustBeIntArrayValidate;
use think\facade\Event;

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
    public function start($deviceNo = '', $send = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_START, $send);

        return true;
    }

    //暂停加水
    public function pause($deviceNo = '', $send = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_PAUSE, $send);

        return true;
    }

    //加水完成
    public function finish($deviceNo = '', $send = false)
    {
        $this->control($deviceNo, DeviceControl::STATE_FINISH, $send);

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
    public function online($imei = '')
    {
        if (empty($imei)) {
            throw new ParamErrorException(Message::DEVICE_IMEI_EMPTY);
        }

        $data = $this->getModel()->where('imei', $imei)->find();

        if ($data) {
            return $data;
        }

        $n = (int)($this->getModel()->max('id') + 1);

        $number = str_pad($n, 6, '0', STR_PAD_LEFT);
        $params = [
            'name'      => $number,
            'device_no' => $number,
            'imei'      => $imei,
            'status'    => Device::STATUS_OFF,
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
    protected function control($deviceNo, $state, $send = false)
    {
        $device = $this->getDevice($deviceNo);
        $this->checkCanControl($device, $state);
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
    protected function checkCanControl($device, $state)
    {
        $user = $this->user;

        if ($state == DeviceControl::STATE_START && $user->getUserInfo()->flow <= 0) {
            throw new MessageException(Message::NO_FLOW);
        }

        $logic = new DeviceControlLogic();

        return $logic->checkCanControl($device, $state);
    }

    /**
     * 添加设备控制日志
     * @param $device
     * @param $state 状态
     * @return \app\model\BaseModel
     * @throws MessageException
     */
    public function addDeviceControl($device, $state)
    {
        $logic = new DeviceControlLogic();

        $status = $logic->addByDevice($device, $state);

        return $status;
    }

    public function sendDeviceControl($device, $state)
    {
        $logic = new DeviceControlLogic();

        $status = $logic->sendByDevice($device, $state);

        return $status;
    }
}