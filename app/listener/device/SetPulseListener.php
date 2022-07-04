<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/17
 * Time: 17:24
 */

namespace app\listener\device;


class SetPulseListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $num = $detail['num'] ?? rand(10, 99);
        $this->e('正在设置脉冲' . $num);
        $this->device->l_to_pulse = $num;
        $this->device->save();
        $this->deviceControlService->writeTemperature($num)->sleep();
    }
}