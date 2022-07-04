<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:11
 */

namespace app\listener\device;


class DeviceStartControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $this->e('正在启动');
        $this->deviceControlService->start()->sleep(0.5)->start()->sleep();
        $this->e('已经启动');
    }
}