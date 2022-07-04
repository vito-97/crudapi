<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 11:00
 */

namespace app\service;

use app\model\User;

class TokenService
{
    const ADMIN = 'admin';
    const USER = 'user';
    const AGENT = 'agent';
    const WATER_COMPANY = 'water_company';
    const WATERWORKS = 'waterworks';
    const CUSTOMER = 'customer';
    const WATER_FETCHER = 'water_fetcher';
    const REPAIR = 'repair_user';
    const COUPON = 'coupon_user';
    const FACTORY = 'factory_user';

    const DEFAULT = 'default';

    protected $type = null;

    public function __construct($type = self::DEFAULT)
    {
        $this->type = $type;
    }

    /**
     * 设置数据
     * @param array $data
     * @param int $expire
     * @return false|string
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function set($data = [], int $expire = 0)
    {

        $token = self::getToken();

        $status = self::cache()->set($this->scope($token), $data, $expire);

        return $status ? $token : false;
    }

    /**
     * 获取token里的数据
     * @param $key
     * @return mixed
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function get($key)
    {
        $result = self::cache()->get($this->scope($key));

        return $result;
    }

    /**
     * 删除数据
     * @param $key
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function delete($key)
    {
        self::cache()->delete($this->scope($key));

        return true;
    }

    /**
     * 获取token
     * @return string
     */
    protected function getToken()
    {
        return md5(uniqid('token'));
    }

    /**
     *
     * @return \think\cache\Driver
     */
    protected function cache()
    {
        return RedisStoreService::driver();
    }

    /**
     * 传入token获取当前的范围键
     * @param $key
     * @return string
     */
    protected function scope($key)
    {
        return $this->type . '_' . $key;
    }
}