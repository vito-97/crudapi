<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/12
 * Time: 16:11
 */

namespace app\listener\device;


class SetTemperatureListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $num = $detail['num'] ?? rand(1, 30);
        $this->e('正在设置温度' . $num);
        $this->device->temperature = $num;
        $this->device->save();
        $this->deviceControlService->writeTemperature($num)->sleep();
    }
}