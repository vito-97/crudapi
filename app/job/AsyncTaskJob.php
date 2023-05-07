<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/28
 * Time: 10:38
 */

namespace app\job;

use app\command\async_task\Dispatch;
use think\queue\Job;

class AsyncTaskJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        $dispatch = new Dispatch();

        $dispatch->run($data);

        return true;
    }
}
