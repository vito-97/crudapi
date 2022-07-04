<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/13
 * Time: 14:22
 */

namespace app\listener\pay;


use app\common\Enum;
use app\exception\DeviceControlErrorException;
use app\job\DeviceControlCheckJob;
use app\logic\DeviceLogic;
use app\model\DeviceControl;
use app\service\DeviceService;
use app\service\user\UserService;
use think\Container;
use think\facade\Queue;
use think\Request;

class PaySuccessControlDeviceWaitListener
{
    public function handle($params, Request $request)
    {
        $order = $params['order'];
        //充值订单
        if ($order->is_recharge && !empty($params['result'])) {
            $device = $order->device;
            if ($device) {
                $user = new UserService($order->user, '');
                $request->setUser($user);

                try {
                    //将机器设置为待启动
                    $logic = new DeviceLogic();
                    $logic->wait($device, DeviceControl::STATE_WAIT);

                    /**
                     * @var  DeviceService $deviceService
                     */
                    $deviceService = Container::getInstance()->make(DeviceService::class);
                    $control       = $deviceService->deviceLastControl($device['id']);

                    if ($control->user_id == $order->user_id && $control['state'] == DeviceControl::STATE_WAIT) {
                        $deviceService->deviceWantControlUserID($device->device_no, $order->user_id);
                        Queue::later(2, DeviceControlCheckJob::class, ['device_id' => $control->device_id, 'state' => DeviceControl::STATE_WAIT], Enum::JOB_DEVICE_CONTROL_CHECK);
                    }
                } catch (DeviceControlErrorException $e) {

                }
            }
        }
    }
}