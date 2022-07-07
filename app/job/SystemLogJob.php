<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 16:53
 */

namespace app\job;


use think\queue\Job;

class SystemLogJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        // TODO: Implement execute() method.
    }
}