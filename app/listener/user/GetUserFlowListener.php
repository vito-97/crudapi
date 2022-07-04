<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 9:25
 */

namespace app\listener\user;


use app\service\DeviceService;

class GetUserFlowListener
{
    public function handle($user)
    {
        if ($user) {
            $service = new DeviceService();
            $flow    = $service->userUseFLow($user->id);

            if ($flow > 0) {
                $user->flow = $user->flow - $flow;
            }
        }
    }
}