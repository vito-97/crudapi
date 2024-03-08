<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2024/3/8
 * Time: 17:17
 */

namespace app\service;

use think\facade\Cache;
use think\helper\Str;

class LockerService
{
    const GET_LOCK_STATUS = 'get';

    /**
     * 拿锁操作
     * @param string $key
     * @param $callback
     * @param $wait
     * @param int $expire
     * @return string|true|null
     */
    public static function lock(string $key, $callback, $wait = null, int $expire = 60)
    {
        if ($wait && is_numeric($wait)) {
            $expire = $wait;
            $wait   = null;
        }
        $lockKey = self::getLockKey($key);
        $waitKey = self::getLockWaitKey($key);
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
                    $status = self::GET_LOCK_STATUS;
                    break;
                }
            }
            msleep(rand(80, 120));
        }

        try {
            call_user_func($callback, $status);
        } finally {
            self::unlock($lockKey);
        }

        return $status;
    }

    /**
     * 解锁
     * @param $key
     * @return void
     */
    protected static function unlock($key)
    {
        Cache::delete($key);
    }

    /**
     * 获取锁的键
     * @param $key
     * @return string
     */
    protected static function getLockKey($key)
    {
        return 'lock:' . $key;
    }

    /**
     * 获取锁的等待数键
     * @param $key
     * @return string
     */
    protected static function getLockCountKey($key)
    {
        return 'lock_count:' . $key;
    }

    /**
     * 获取锁的等待队列数组
     * @param $key
     * @return string
     */
    protected static function getLockWaitKey($key)
    {
        return 'lock_wait:' . $key;
    }

    /**
     * 清除缓存
     */
    public static function clearCache()
    {
        self::clearLockWait();
        self::clearLockCount();
    }

    /**
     * 清空锁的等待数
     * @return void
     */
    public static function clearLockCount()
    {
        Cache::delete('lock_count');
    }

    /**
     * 清空锁的等待列表
     * @return void
     */
    public static function clearLockWait()
    {
        Cache::delete('lock_wait');
    }

    public static function isGetLockStatus($status)
    {
        return $status === self::GET_LOCK_STATUS;
    }
}
