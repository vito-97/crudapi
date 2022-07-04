<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 15:33
 */

namespace app\model;


use app\common\ErrorCode;
use app\common\EventName;
use app\exception\DeviceControlErrorException;
use app\exception\ValidateException;
use app\model\traits\DeviceTrait;
use app\model\traits\UserTrait;
use think\facade\Event;

class DeviceControl extends BaseModel
{
    use UserTrait;
    use DeviceTrait;

    const STATE_WAIT = 1;
    const STATE_START = 2;
    const STATE_PAUSE = 3;
    const STATE_FINISH = 4;
    const STATE_WAIT_TIMEOUT = 5;

    protected $stateEnum = [
        self::STATE_WAIT         => '待启动',
        self::STATE_START        => '启动中',
        self::STATE_PAUSE        => '暂停中',
        self::STATE_FINISH       => '已停止',
        self::STATE_WAIT_TIMEOUT => '等待超时',
    ];

    const STATE_KEY = [
        self::STATE_WAIT         => 'wait',
        self::STATE_START        => 'start',
        self::STATE_PAUSE        => 'pause',
        self::STATE_FINISH       => 'finish',
        self::STATE_WAIT_TIMEOUT => 'wait_timeout',
    ];

    /**
     * 允许待启动的时间
     * 到时间强制结束
     */
    const WAIT_TIMEOUT = 240;

    /**
     * 允许暂停的时间
     * 到时间则强制结束
     */
    const PAUSE_TIMEOUT = 240;

    /**
     * 允许启动的最大时间
     */
    const START_TIMEOUT = 99999;

    /**
     * 获取设备最后一次操作的内容
     * @param int $deviceID
     * @param int $userID
     * @return DeviceControl|array|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getDeviceLastControl($deviceID, $userID = 0)
    {
        $where = [
            'device_id' => $deviceID,
        ];
        if ($userID) $where['user_id'] = $userID;
        return $this->order('id', 'desc')->field(['user_id', 'device_id', 'state', 'create_time'])->where($where)->find();
    }

    /**
     * 获取用户最后一次操作的记录
     * @param $userID
     * @return DeviceControl|array|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getUserLastControl($userID)
    {
        $where = ['user_id' => $userID];
        return $this->order('id', 'desc')->field(['user_id', 'device_id', 'state', 'create_time'])->where($where)->find();
    }

    /**
     * 检测用户是否可以操作
     * @param $userID
     * @param $state
     * @return $this
     * @throws ValidateException
     * @throws \app\exception\ErrorException
     */
    public function checkUserCanControl($userID, $state)
    {
        $this->checkModelData('device_id');
        //状态不是完成 操作中的用户也不是传入的用户
        if (($this->isStartState() || $this->isPauseState() || $this->isWaitState()) && $userID != $this->getData('user_id')) {
//            当前设备已有其他用户操作中
            throw new DeviceControlErrorException(ErrorCode::DEVICE_HAS_OTHER_USER_CONTROL);
        }

        //判断需要执行的操作
        //跟最后一次操作做对比 判断是否可以执行操作
        switch ($state) {
            case self::STATE_WAIT:
                if ($this->isWaitState()) {

//                    当前设备正在等待启动
                    throw new DeviceControlErrorException(ErrorCode::DEVICE_IS_WAIT_CONTROL);
                }
                break;

            case self::STATE_START:
                if ($this->isStartState()) {
                    $params = ['control' => $this, 'device' => $this->device];
                    Event::trigger(EventName::DEVICE_CONTROL_START, $params);
//                    当前设备已在加水
                    throw new DeviceControlErrorException(ErrorCode::DEVICE_IS_START_CONTROL);
                }
                break;

            case self::STATE_PAUSE:
                if ($this->isPauseState()) {
                    $params = ['control' => $this, 'device' => $this->device];
                    Event::trigger(EventName::DEVICE_CONTROL_PAUSE, $params);
//                    当前设备已暂停加水
                    throw new DeviceControlErrorException(ErrorCode::DEVICE_IS_PAUSE_CONTROL);
                }
                if (!$this->isStartState()) {
//                    当前设备未在加水
                    throw new DeviceControlErrorException(ErrorCode::DEVICE_IS_NOT_START_CONTROL);
                }
                break;

            case self::STATE_FINISH:
                if ($this->isFinishState()) {
                    $params = ['control' => $this, 'device' => $this->device];
                    Event::trigger(EventName::DEVICE_CONTROL_FINISH, $params);
                    //当前设备未启动
                    throw new DeviceControlErrorException(ErrorCode::DEVICE_IS_FINISH_CONTROL);
                }
                break;
        }

        return $this;
    }

    public function isWaitState()
    {
        return $this->getData('state') == self::STATE_WAIT;
    }

    public function isStartState()
    {
        return $this->getData('state') == self::STATE_START;
    }

    public function isPauseState()
    {
        return $this->getData('state') == self::STATE_PAUSE;
    }

    public function isFinishState()
    {
        return $this->getData('state') == self::STATE_FINISH;
    }

    public function isWaitTimeoutState()
    {
        return $this->getData('state') == self::STATE_WAIT_TIMEOUT;
    }

    /**
     * 判断操作是否超时
     * @return bool
     */
    public function isTimeout()
    {
        return $this->isWaitTimeout() || $this->isPauseTimeout() || $this->isStartTimeout();
    }

    /**
     * 等待启动超时
     * @return bool
     */
    public function isWaitTimeout()
    {
        $time = $this->getTime();
        return $this->isWaitState() && ($time + self::WAIT_TIMEOUT) < time() || $this->isWaitTimeoutState();
    }

    /**
     * 暂停超时
     * @return bool
     */
    public function isPauseTimeout()
    {
        $time = $this->getTime();
        return $this->isPauseState() && ($time + self::PAUSE_TIMEOUT) < time();
    }

    /**
     * 使用超时
     * @return bool
     */
    public function isStartTimeout()
    {
        $time = $this->getTime();
        return $this->isStartState() && ($time + self::START_TIMEOUT) < time();
    }

    /**
     * 获取状态
     * @return string
     */
    public function getStateKey()
    {
        if ($this->isStartTimeout() || $this->isPauseTimeout()) {
            return 'timeout';
        }

        return self::STATE_KEY[$this->state];
    }

    protected function getTime()
    {
        $time = $this->getData('create_time');
        if (is_string($time)) {
            $time = strtotime($time);
        }

        return $time;
    }

    protected function getStateDescAttr($value, $data)
    {
        return $this->getEnumDesc('state', $data);
    }

    /**
     * 设置控制已完成
     * @return bool
     */
    protected function setControlFinish()
    {
        $model            = new DeviceControl();
        $model->device_id = $this->getData('device_id');
        $model->user_id   = $this->getData('user_id');
        $model->state     = self::STATE_FINISH;

        return $model->save();
    }
}