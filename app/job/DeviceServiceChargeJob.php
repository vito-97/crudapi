<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/26
 * Time: 17:42
 */

namespace app\job;


use think\queue\Job;

//设备服务费生成
class DeviceServiceChargeJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {

        return true;
    }
}
