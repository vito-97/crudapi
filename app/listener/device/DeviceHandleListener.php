<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:26
 */

namespace app\listener\device;

use app\model\Device;
use app\model\DeviceControl;
use app\service\DeviceControlService;
use think\facade\Request;

class DeviceHandleListener
{
    protected $mqtt;

    protected $deviceControlService;

    /**
     * @var Device
     */
    protected $device;
    /**
     * @var DeviceControl
     */
    protected $control;

    public function __construct(DeviceControlService $deviceControlService)
    {
        $this->deviceControlService = $deviceControlService;
    }

    public function handle($detail)
    {
        ['device' => $device] = $detail;

        $this->deviceControlService->setImei($device->imei);

        if (isset($detail['control'])) {
            $this->control = $detail['control'];
        }

        $this->device = $device;

        return $this->run($detail);
    }

    protected function run($detail)
    {

    }

    protected function sleep($time = 0)
    {
        return $this->deviceControlService->sleep($time);
    }

    protected function e($msg)
    {
        if (Request::isCli()) {
            $date = date('Y-m-d H:i:s');
            dump("[{$date}][{$this->device->device_no}]{$msg}");
        }

        return $this;
    }
}