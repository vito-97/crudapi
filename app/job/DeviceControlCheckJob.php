<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/29
 * Time: 9:35
 */

namespace app\job;


use app\logic\DeviceControlLogic;
use app\service\DeviceService;
use think\Container;
use think\facade\Log;
use think\queue\Job;

class DeviceControlCheckJob extends BaseJob
{
    protected $attempts = 5;

    protected function execute($data, Job $job): bool
    {
        if (isset($data['device_id']) && isset($data['state'])) {
            /**
             * @var  DeviceService $deviceService
             */
            $deviceService = Container::getInstance()->make(DeviceService::class);
            $control       = $deviceService->deviceLastControl($data['device_id']);

            //最后一次操作和传入的操作是一样的 则继续发送
            if ($control['state'] == $data['state']) {
                /**
                 * @var DeviceControlLogic $logic
                 */
                $logic = Container::getInstance()->make(DeviceControlLogic::class);
                try {
                    $logic->sendByControl($control);
                } catch (\Throwable $e) {
                    dump('Error' . $e->getMessage());
                    Log::error('device check error' . $e->getMessage());
                }
                //设置延时时间
                $this->delay = $job->attempts() * 2;
//                Log::write('延时时间：' . $this->delay);
                //先返回false 让队列延时再次进入判断
                return false;
            }
        }

        return true;
    }
}