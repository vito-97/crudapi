<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/13
 * Time: 10:54
 */

namespace app\listener\device;


use app\service\DeviceService;

class DeviceWaitTimeoutControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        //初始化流量数据
        $service = new DeviceService();
        $userID  = $this->control->user_id;
        $service->userFlowInit($userID);

        $this->e('等待启动已经超时');
        $this->deviceControlService->finish()
            ->sleep(1.5)
            ->init()
            ->sleep(1.5)
            ->clearFlow()
            ->sleep(1.5);
    }
}