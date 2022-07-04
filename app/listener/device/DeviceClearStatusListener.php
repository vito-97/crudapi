<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 16:45
 */

namespace app\listener\device;


class DeviceClearStatusListener extends DeviceHandleListener
{
    public function run($detail)
    {
        $this->e('正在清除状态');
        $this->deviceControlService->clearStatus()->sleep();
        $this->e('清除状态完成');
    }
}