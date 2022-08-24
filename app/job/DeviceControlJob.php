<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/17
 * Time: 9:23
 */

namespace app\job;

use app\service\DeviceControlService;
use think\queue\Job;

class DeviceControlJob extends BaseJob
{
    protected $deviceControlService;

    public function __construct(DeviceControlService $deviceControlService)
    {
        $this->deviceControlService = $deviceControlService;
    }

    protected function execute($data, Job $job): bool
    {
        if (isset($data['imei']) && isset($data['msg'])) {
            $this->deviceControlService->setImei($data['imei']);
            $this->deviceControlService->send($data['msg'], $data['func'] ?? 'hex2str');
        }

        return true;
    }
}
