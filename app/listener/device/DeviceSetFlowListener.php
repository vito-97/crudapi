<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 16:57
 */

namespace app\listener\device;


use app\service\DeviceService;

class DeviceSetFlowListener extends DeviceHandleListener
{
    public function run($detail)
    {
        $device = $this->device;

        $service   = new DeviceService();
        $userID    = $this->control->user_id;
        $isSetFlow = $service->userStartFlow($userID, true);

        //未初始余额
        if (!$isSetFlow) {
            $user = $this->control->user;
            $flow = $user->flow;

            if ($flow <= 0) {
                return;
            }

            $service->userStartFlow($userID, $flow);
            $this->deviceControlService->writeFlow($flow)->sleep(0.5)->writeFlow($flow);
        } else {
//            $hasSet = $service->userStopFlow($userID);
//            if (is_null($hasSet) || false === $hasSet) {
            $this->deviceControlService->writeFlow($isSetFlow)->sleep(0.5)->writeFlow($isSetFlow);
//            }
        }
    }
}