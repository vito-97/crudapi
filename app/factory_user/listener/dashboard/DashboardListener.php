<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\factory_user\listener\dashboard;

use app\common\ArrayObject;
use app\logic\DeviceLogic;
use app\model\Device;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $device     = new DeviceLogic();

        $params->merge([
            'count_device'               => $device->count(),
            'count_online_device'        => $device->where('status', Device::STATUS_ON)->count(),
            'count_fault_device'         => $device->where('status', Device::STATUS_FAULT)->count(),
        ]);
    }
}