<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 16:32
 */

namespace app\listener\device;


class SetDeviceListenerNoListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $this->e('正在设置设备号');
        $this->deviceControlService->writetDeviceNo($this->device->device_no)->sleep();
    }
}