<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:12
 */

namespace app\listener\device;


class DevicePauseControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $this->e('正在暂停');
        $this->deviceControlService->pause()->sleep(0.5)->pause();
        $this->e('已经暂停');
    }
}