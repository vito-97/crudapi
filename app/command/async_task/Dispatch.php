<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/28
 * Time: 9:19
 */

namespace app\command\async_task;

use think\Container;
use think\facade\Cache;
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
                    $this->logger("未定义方法：{$method}");
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

    protected function deviceExecCmd($data)
    {
        ['id' => $id, 'cmd' => $command] = $data;

        $lockKey = 'async_device_exec_cmd_' . $id;

        $this->lock($lockKey, function ($status) use ($id, $command, $data) {
            if ('get' === $status) {
                $this->logger('已经拿到锁');
                $this->logger($data);
                msleep(1000);
            }

            //todo
        }, function () use ($id) {
            $this->logger("设备{$id}正在排队等待下发指令");
        });
    }

    /**
     * 拿锁操作
     * @param string $key
     * @param $callback
     * @param $wait
     * @param int $expire
     * @return string|true|null
     */
    protected function lock(string $key, $callback, $wait = null, int $expire = 60)
    {
        if ($wait && is_numeric($wait)) {
            $expire = $wait;
            $wait   = null;
        }
        $lockKey = $this->getLockKey($key);
        $waitKey = $this->getLockWaitKey($key);
        $waitId  = Str::random();
        $has     = Cache::has($lockKey);
        $status  = null;
        // 已加锁
        if ($has) {
            Cache::rpush($waitKey, $waitId);
            $wait && call_user_func($wait);
        } else {
            Cache::set($lockKey, 1, 60);
            $status = true;
        }

        $i = 0;
        while ($has) {
            if (!Cache::has($lockKey)) {
                //等待的队列里第一个不是现在等待的id
                if (Cache::lindex($waitKey, 0) !== $waitId) {
                    $i++;
                    //10次代表该等待队列已失效则弹出
                    if ($i >= 10) {
                        Cache::lpop($waitKey);
                        $i = 0;
                    }
                    //上锁
                } else if (Cache::set($lockKey, 1, $expire)) {
                    Cache::lpop($waitKey);
                    $status = 'get';
                    break;
                }
            }
            msleep(rand(80, 120));
        }

        try {
            call_user_func($callback, $status);
        } finally {
            $this->unlock($lockKey);
        }

        return $status;
    }

    /**
     * 解锁
     * @param $key
     * @return void
     */
    protected function unlock($key)
    {
        Cache::delete($key);
    }

    /**
     * 获取锁的键
     * @param $key
     * @return string
     */
    protected function getLockKey($key)
    {
        return 'lock:' . $key;
    }

    /**
     * 获取锁的等待数键
     * @param $key
     * @return string
     */
    protected function getLockCountKey($key)
    {
        return 'lock_count:' . $key;
    }

    /**
     * 获取锁的等待队列数组
     * @param $key
     * @return string
     */
    protected function getLockWaitKey($key)
    {
        return 'lock_wait:' . $key;
    }

    /**
     * 清除缓存
     * @return $this
     */
    public function clearCache(): Dispatch
    {
        $this->clearLockWait();
        $this->clearLockCount();
        return $this;
    }

    /**
     * 清空锁的等待数
     * @return void
     */
    public function clearLockCount()
    {
        Cache::delete('lock_count');
    }

    /**
     * 清空锁的等待列表
     * @return void
     */
    public function clearLockWait()
    {
        Cache::delete('lock_wait');
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
