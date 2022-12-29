<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 11:00
 */

namespace app\service;

use app\common\Enum;

class TokenService
{
    const ADMIN = 'admin';
    const USER  = 'user';
    const DEFAULT = 'default';

    //最大同时登录个数
    const MAX_LOGIN = Enum::MAX_LOGIN;

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

        $status = $status ? $token : false;

        if ($status) {
            $id = $data['id'] ?? 0;

            if ($id) {
                $this->appendLoginToken($id, $token);
            }
        }

        return $status;
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
     * @param bool $removeLoginToken
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function delete($key, $removeLoginToken = true)
    {
        if ($removeLoginToken) {
            $data = $this->get($key);

            if ($data && !empty($data['id'])) {
                $table = $this->getTokensTable();
                $id    = $data['id'];

                $tokens = RedisStoreService::tableGet($table, $id) ?? [];

                if (in_array($key, $tokens)) {
                    unset($tokens[array_search($key, $tokens)]);
                    ksort($tokens);
                    RedisStoreService::tableSet($table, $id, $tokens);
                }
            }
        }

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

    /**
     * 追加token
     * @param $id
     * @param $token
     * @return $this
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    protected function appendLoginToken($id, $token)
    {
        $table    = $this->getTokensTable();
        $tokens   = RedisStoreService::tableGet($table, $id) ?? [];
        $tokens[] = $token;
        $len      = count($tokens);

        if ($len > self::MAX_LOGIN) {
            $remove = array_splice($tokens, 0, -self::MAX_LOGIN);

            foreach ($remove as $item) {
                $this->delete($item, false);
            }
        }

        RedisStoreService::tableSet($table, $id, $tokens);

        return $this;
    }

    /**
     * 移除所有登录的token
     * @param $id
     * @return $this
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function removeLoginToken($id)
    {
        $table  = $this->getTokensTable();
        $tokens = RedisStoreService::tableGet($table, $id) ?? [];

        foreach ($tokens as $token) {
            $this->delete($token, false);
        }

        RedisStoreService::tableDel($table, $id);

        return $this;
    }

    /**
     * 获取保存token的表
     * @return string
     */
    protected function getTokensTable()
    {
        return "{$this->type}_token";
    }
}
