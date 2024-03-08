<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 11:13
 */

namespace app\service;

use think\cache\driver\Redis;
use think\facade\Cache;

/**
 * Class RedisStore
 * @mixin Redis
 * @package app\service
 */
class RedisStoreService
{
    protected static $driver;

    protected static string $store = 'redis';

    public static function setStore($store)
    {
        self::$store = $store;
    }

    /**
     * 获取驱动
     * @param null $name
     * @return \think\cache\Driver
     */
    public static function driver($name = null)
    {
        $name = $name ?? self::$store;

        if (!self::$driver) {
            self::$driver = Cache::store($name);
        }

        return self::$driver;
    }

    /**
     * redis hash表数据存储
     * @param $table
     * @param $key
     * @param null $data
     * @param string $callback
     * @param boolean $cache
     * @return int|mixed
     */
    public static function tableRemember($table, $key, $data = null, $callback = '', $cache = true)
    {
        if (is_bool($data)) {
            if ($data) {
                return self::tableGet($table, $key);
            } else {
                return self::tableDel($table, $key);
            }
        }

        if ($data || !is_null($data)) {
            $status = self::tableSet($table, $key, $data);

            return $data;
        } else {
            if ($cache) {
                $data = self::tableGet($table, $key);
            } else {
                $data = null;
            }
            if (is_null($data) && $callback) {

                $data = $callback();

                if ($data || !is_null($data)) {

                    self::tableSet($table, $key, $data);
                }
            }

            return $data;
        }
    }

    /**
     * 获取redis hash表的数据
     * @param $table
     * @param $key
     * @return mixed|null
     */
    public static function tableGet($table, $key)
    {
        $data = self::driver()->hget($table, $key);
        if ($data || $data === 0) {
            $len = mb_strlen($data);

            if (is_string($data) && in_array($data[0], ['{', '[']) && in_array($data[$len - 1], ['}', ']'])) {
                $data = json_decode($data, true);
            }

            return $data;
        }

        return null;
    }

    /**
     * 删除
     * @param $table
     * @param mixed ...$key
     * @return mixed
     */
    public static function tableDel($table, ...$key)
    {
        $n = self::driver()->hdel($table, ...$key);

        return $n;
    }

    /**
     * 设置redis hash表的数据
     * @param $table
     * @param $key
     * @param $data
     * @return mixed
     */
    public static function tableSet($table, $key, $data)
    {
        if (is_array($data) || is_object($data)) {

            if (is_object($data)) {
                if (method_exists($data, 'toArray')) {
                    $data = $data->toArray();
                }

                if (!$data) {
                    return null;
                }
            }

            $data = json_encode($data);

        }

        return self::driver()->hset($table, $key, $data);
    }

    public static function __callStatic($name, $arguments)
    {
        return call_user_func_array([self::driver(), $name], $arguments);
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([self::driver(), $name], $arguments);
    }
}
