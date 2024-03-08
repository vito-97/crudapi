<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/28
 * Time: 9:19
 */

namespace app\command\async_task;

use app\common\EventName;
use app\service\LockerService;
use think\Container;
use think\facade\Cache;
use think\facade\Event;
use think\helper\Str;

class Dispatch
{
    /**
     * 用于调度方法
     * @param $data
     * @return void
     */
    public function run($data)
    {
        try {
            if (!$data) {
                return;
            }

            $this->logger($data);

            if (is_string($data)) {
                $res = json_decode($data, true);
            } else {
                $res = $data;
            }

            if (isset($res['name']) && isset($res['data'])) {
                $method = Str::camel($res['name']);
                if (method_exists($this, $method)) {
                    $this->$method($res['data']);
                } else {
                    Event::trigger(sprintf(EventName::ASYNC_TASK, Str::snake($method)), $res['data']);
                }
            } else {
                $this->logger('数据错误：' . $data);
            }

        } catch (\Throwable $e) {
            $this->logger('程序运行错误：' . $e->getMessage() . ' in file ' . $e->getFile() . ' line ' . $e->getLine());

            $trace = $e->getTrace();
            foreach ($trace as $level) {
                echo "{$level['function']} called at {$level['file']}:{$level['line']}\n";
            }

            try {
                $status = Cache::ping() ? 'online' : 'offline';
            } catch (\Throwable $e) {
                $this->logger($e->getMessage());
                Container::getInstance()->delete('think\Cache');
                $status = 'offline';
            }

            $this->logger("Redis ping status: ${status}");
        }
    }

    protected function asyncDemo($data)
    {
        ['id' => $id, 'other_var' => $otherVar] = $data;

        $lockKey = 'async_demo_' . $id;
        LockerService::lock($lockKey, function ($status) use ($id, $data) {
            if (LockerService::isGetLockStatus($status)) {
                $this->logger('已经拿到锁');
                $this->logger($data);
                msleep(1000);
            }

            //todo
        }, function () use ($id) {
            $this->logger("异步任务{$id}正在排队等待执行");
        });
    }

    /**
     * 输出日志
     * @param $msg
     * @return void
     */
    public function logger($msg)
    {
        if (!is_string($msg)) {
            $msg = json_encode($msg);
        }

        $date = date('Y-m-d H:i:s');
        dump("[$date]$msg");
    }
}
