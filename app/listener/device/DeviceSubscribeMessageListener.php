<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 17:48
 */

namespace app\listener\device;

use app\common\Enum;
use app\common\EventName;
use app\job\DeviceRestartJob;
use app\logic\DeviceLogic;
use app\model\DeviceControl;
use app\model\User;
use app\service\DeviceControlService;
use app\service\DeviceService;
use app\service\user\UserService;
use think\Container;
use think\facade\Env;
use think\facade\Event;
use think\facade\Queue;
use think\facade\Request;

class DeviceSubscribeMessageListener
{
    protected $deviceNo;
    protected $deviceID;
    protected $hex;
    protected $msg;
    protected $imei;
    protected $date;
    /**
     * @var DeviceService
     */
    protected $service;
    /**
     * @var DeviceControl
     */
    protected $control;

    //消息头对应的执行方法
    protected $method = [
        Enum::DEVICE_FLOW_CODE      => 'nowFlow',
        Enum::DEVICE_ONLINE_CODE    => 'online',
        Enum::DEVICE_START_CODE     => 'start',
        Enum::DEVICE_PAUSE_ON_CODE  => 'pauseOn',
        Enum::DEVICE_PAUSE_OFF_CODE => 'pauseOff',
        Enum::DEVICE_STOP_CODE      => 'stop',
    ];

    public function handle($params)
    {
        $deviceNo       = $this->deviceNo = $params['device_no'];
        $this->deviceID = $params['device_id'];
        $hex            = $this->hex = $params['hex'];
        $msg            = $this->msg = $params['msg'];
        $this->service  = $params['service'];
        $this->control  = $params['control'];
        $this->imei     = $params['imei'];
        $this->date     = date('Y-m-d H:i:s');

        if (Env::get('APP_DEBUG') || Env::get('MQTT_DEBUG')) {
            $this->e($hex);
        }

        foreach ($this->method as $start => $name) {
            if (($i = strpos($hex, strtoupper($start))) === 0) {
                Container::getInstance()->invokeMethod([$this, $name], [$deviceNo, $hex]);
                break;
            }
        }
    }


    /**
     * 当前剩余流量
     * @param $deviceNo
     * @param $hex
     * @param $msg
     * @param $i
     */
    public function nowFlow($deviceNo, $hex)
    {
        $i = strpos($hex, Enum::DEVICE_FLOW_START_CODE);

        if ($i === false) {
            $this->e('流量已清零');
            return;
        }

        $i   += strlen(Enum::DEVICE_FLOW_START_CODE);
        $num = substr($hex, $i, 8);

        if (strlen($num) === 8) {
            $n1 = substr($num, 4, 4);
            $n2 = substr($num, 0, 4);
            $n  = hexdec($n1 . $n2);

            $service = $this->service;
            $userID  = $service->deviceLastControlUserID($deviceNo) ?: 0;

            if ($n > 10e8) {
                $wantUserID = $this->getWantControlUserID();
                $this->e('机器可能出现负数，正在初始化');
                $control = new DeviceControlService($this->imei);
                $control->init()->sleep()->clearFlow()->sleep()->finish();

                //该用户想控制设备 但设备出现负数
                if ($wantUserID == $userID) {
                    $this->e('重新启动设备');
                    $msg = [
                        'device_no' => $deviceNo,
                        'device_id' => $this->deviceID,
                        'imei'      => $this->imei,
                        'state'     => DeviceControl::STATE_WAIT,
                        'user_id'   => $userID,
                    ];

                    Queue::later(2, DeviceRestartJob::class, $msg, Enum::JOB_DEVICE_RESTART);
                    Queue::later(4, DeviceRestartJob::class, $msg, Enum::JOB_DEVICE_RESTART);
                }
            } else {
                $this->e('当前剩余流量：' . $n . 'L');

                if ($userID) {
                    $service->userStopFlow($userID, $n);
                }
            }

        }
    }

    public function online($deviceNo, $hex)
    {
        $this->e('上线');
        $logic = new DeviceLogic();
        $logic->online($this->imei);
    }

    public function start(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('加注');
        $deviceService = $this->service;
        if (($this->control && !$this->control->isStartState()) || !$this->control) {
            $userID = $this->getWantControlUserID();
            $user   = $this->getUser($userID);

            if (!$user) return false;
            $logic = new DeviceLogic();
            $logic->start($deviceNo);

        }
    }

    public function pauseOn(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('已暂停');
        if ($this->control && !$this->control->isPauseState()) {
            $user = $this->getUser();
            if (!$user) return false;
            $logic = new DeviceLogic();
            $logic->pause($deviceNo);
        }
    }

    public function pauseOff(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('暂停已结束');
    }

    public function stop(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('已结算');
        if ($this->control) {
            $user   = $this->getUser();
            $params = ['device' => $this->control->device, 'control' => $this->control];
            Event::trigger(EventName::DEVICE_UPDATE_FLOW, $params);

            //最后一次操作不是完成
            if (!$this->control->isFinishState()) {
                $request->setUser(new UserService($this->control->user, md5(uniqid())));
                $logic = new DeviceLogic();
                $logic->finish($deviceNo);
            }

            //清除该设备想控制的用户ID
//            $this->service->deviceWantControlUserID($this->deviceNo, false);
        }
    }

    /**
     * 获取想控制的用户ID
     * @return int|mixed|null
     */
    protected function getWantControlUserID()
    {
        $userID = $this->service->deviceWantControlUserID($this->deviceNo);

        if ($userID) {
            $this->service->deviceWantControlUserID($this->deviceNo, false);
        }

        return $userID;
    }

    /**
     * 获取用户
     * @param $userID
     * @return User|array|false|mixed|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getUser($userID = 0)
    {
        if ($userID) {
            $user = User::scope('status')->find($userID);
        }

        if (empty($user) && $this->control) {
            $user = $this->control->user;
        }

        if (empty($user) && $this->deviceNo !== '000001') {
            $logic  = new DeviceLogic();
            $device = $logic->getModel()->where('device_no', $this->deviceNo)->find();

            if ($device) {
                $this->e('用户不存在，正在停止机器');
                Event::trigger(EventName::DEVICE_CONTROL_FINISH, ['device' => $device]);
            }

            return false;
        }

        $this->setLoginUser($user);

        return $user;
    }

    /**
     * 设置登录用户
     * @param $user
     * @return $this
     */
    protected function setLoginUser($user)
    {
        Request::setUser(new UserService($user, md5(uniqid()), UserService::TYPE[$user->type] ?? ''));

        return $this;
    }

    private function e($msg)
    {
        $this->date = date('Y-m-d H:i:s');
        dump('[' . $this->date . '][' . $this->deviceNo . ']' . $msg);
    }
}