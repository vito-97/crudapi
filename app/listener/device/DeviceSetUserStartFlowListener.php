<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 16:44
 */

namespace app\listener\device;


use app\service\DeviceService;

class DeviceSetUserStartFlowListener extends DeviceHandleListener
{
    public function run($detail)
    {
        if (!$this->switch) {
            $service = new DeviceService();

            $user = $this->control->user;
            $this->e('正在下发初始余额' . $user->flow . 'L');
            //设置启动机器时的流量
            $service->userStartFlow($user->id, $user->flow);
            $this->e('已经下发初始余额' . $user->flow . 'L');
        }
    }
}
