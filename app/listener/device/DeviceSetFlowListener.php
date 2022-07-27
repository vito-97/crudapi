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
        if ($this->switch) {
            return true;
        }

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
            //获取当前下发流量的状态
            $hasSet = $service->deviceIsSetFlow($device->device_no, true);
            //未下发余额
            if (!$hasSet) {
                $this->deviceControlService->writeFlow($isSetFlow)->sleep(0.5)->writeFlow($isSetFlow);
            }
        }
    }
}
