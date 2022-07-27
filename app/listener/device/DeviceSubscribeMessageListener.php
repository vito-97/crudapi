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
        Enum::DEVICE_FLOW_CODE   => 'nowFlow',
        Enum::DEVICE_ONLINE_CODE => 'online',
//        Enum::DEVICE_START_CODE       => 'start',
//        Enum::DEVICE_PAUSE_ON_CODE    => 'pauseOn',
//        Enum::DEVICE_STOP_FINISH_CODE => 'stopOn',
//        Enum::DEVICE_STOP_CODE        => 'stop',
        '0103000E0001'           => 'checkCode',
        Enum::DEVICE_IS_SET_FLOW => 'isSetFlow',
        '01030064000'            => 'clearFinishFlow',
        '010101005188'           => 'easyDeviceOff',
        '010101031189'           => 'easyDeviceOn',
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

    public function clearFinishFlow($deviceNo, $hex)
    {
        $code = '10304';
        $i    = strpos($hex, $code);

        if ($i === false) {
            $this->e('已使用流量数据错误');
            return;
        }
        $i   += strlen($code);
        $num = substr($hex, $i, 8);

        if (strlen($num) === 8) {
            $n1 = substr($num, 4, 4);
            $n2 = substr($num, 0, 4);
            $n  = hexdec($n1 . $n2);

//            $this->e($num);
//            $this->e($n1 . $n2);
            $this->e("剩余流量：{$n}L");
            $service = $this->service;
            $userID  = $service->deviceLastControlUserID($deviceNo) ?: 0;
            if ($userID) {
                $service->userStopFlow($userID, $n);
            }

            $this->e('正在清除结算余额');
            $deviceServiceControl = new DeviceControlService($this->imei);
            $deviceServiceControl->clearFinishFlow();
        }

//        if ($this->control && $this->control->isFinishState()) {
//        $this->e('设备已结算');

        //结算
//        $this->stop(app()->request, $deviceNo, $hex);
//        }
    }

    /**
     * 判断000E状态
     * @param \app\Request $request
     * @param $deviceNo
     * @param $hex
     */
    public function checkCode($deviceNo, $hex)
    {
        $methods = [
//            '0103020001' => 'isSetFlow',
            '0103020001' => 'start',
            '0103020002' => 'pauseOn',
            '0103020003' => 'stop',
            '0103020000' => 'stopOn',
        ];

        foreach ($methods as $code => $name) {
            if (($i = strpos($hex, strtoupper($code))) !== false) {
                Container::getInstance()->invokeMethod([$this, $name], [$deviceNo, $hex]);
                break;
            }
        }
    }

    /**
     * 已下发余额
     * @param $deviceNo
     * @param $hex
     */
    public function isSetFlow($deviceNo, $hex)
    {
        $this->e('已下发余额');

        if (!$this->service->deviceIsSetFlow($deviceNo, true)) {
            // 设备已经下发流量
            $this->service->deviceIsSetFlow($deviceNo, 1);
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
                $this->isSetFlow($deviceNo, $hex);

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
        $type  = get_device_online_type($hex);
        $logic->online($this->imei, $type);
        if (!$this->control->isFinishState()) {
            $this->e('上次操作未结算，正在结算');
            $this->stop(app()->request, $deviceNo, $hex);
        }
    }

    public function start(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('加注');
        $deviceService = $this->service;
        $isSwitch      = $deviceService->deviceIsSwitch($deviceNo);
        $userID        = $this->getWantControlUserID();
        $user          = $this->getUser($userID);


        if (($this->control && !$this->control->isStartState()) || !$this->control) {

            if (!$user) return false;

            if ($isSwitch) {
                $this->checkUserExpireTime($user);
            } else {
                $logic = new DeviceLogic();
                $logic->start($deviceNo);
            }
        } elseif ($isSwitch) {
            $this->checkUserExpireTime($user);
        }
    }

    /**
     * 检测用户是否已经到期
     * @param $user
     */
    protected function checkUserExpireTime($user)
    {
        if ($user->expire_time <= time()) {
            $this->e('已超出时间，正在停止');
            $logic = new DeviceLogic();
            $logic->finish($this->deviceNo, false, true);
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

    public function stopOn(\app\Request $request, $deviceNo, $hex)
    {
        $this->e('已结算完成');
    }

    public function stop(\app\Request $request, $deviceNo, $hex)
    {
        if (strpos($hex, Enum::DEVICE_PAUSE_ON_CODE) !== false) {
            $this->e('结算指令携带暂停指令，不予处理');
            return;
        }
        //删除已下发流量状态
        $this->service->deviceIsSetFlow($deviceNo, false);
        $this->e('已结算');
        if ($this->control) {
            $user = $this->getUser();

            //最后一次操作不是完成
            if (!$this->control->isFinishState()) {
                $request->setUser(new UserService($this->control->user, md5(uniqid())));
                $logic = new DeviceLogic();
                $logic->finish($deviceNo);
            }

            $params = ['device' => $this->control->device, 'control' => $this->control];
            Event::trigger(EventName::DEVICE_UPDATE_FLOW, $params);

            //清除该设备想控制的用户ID
//            $this->service->deviceWantControlUserID($this->deviceNo, false);
        }
    }

    public function easyDeviceOn($deviceNo, $hex)
    {
        $this->e('简易设备继电器状态全开');
        $this->easyControl(true);
    }

    public function easyDeviceOff($deviceNo, $hex)
    {
        $this->e('简易设备继电器状态全关');
        $this->easyControl(false);
    }

    protected function easyControl($status)
    {
        $control = $this->control;
        $user    = $this->getUser();

        if ($control) {
            //已到期 但是继电器还是打开的
            if ($user->expire_time <= time() && $status) {
                $this->checkUserExpireTime($user);
                //需要启动 但是继电器状态是关闭的
            } elseif ($control->isStartState() && !$status) {
                $this->e('正在启动继电器');
                $logic = new DeviceLogic();
                $logic->start($this->deviceNo, false, true);
                //需要停止 但是继电器状态是打开的
            } elseif ($control->isFinishState() && $status) {
                $this->e('正在关闭继电器');
                $logic = new DeviceLogic();
                $logic->finish($this->deviceNo, false, true);
            }
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
