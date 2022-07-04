<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 15:04
 */

namespace app\service\user;

use app\model\User;
use app\service\TokenService;

abstract class BaseUserService
{
    /**
     * 缓存的用户信息
     */
    protected $user;

    protected $type = TokenService::USER;

    /**
     * 登录用户的token
     */
    protected $token;

    /**
     * @var User
     * 数据库查询出来的最新用户信息
     */
    protected $userinfo;

    /**
     * 是否已经从数据库加载
     * @var bool
     */
    protected $isLoadUserInfo = false;

    /**
     * 设置用户信息
     * BaseUserService constructor.
     * @param $user
     */
    public function __construct($user, $token, $type = null)
    {
        $this->user  = $user;
        $this->token = $token;
        if ($this->type) {
            $this->type = $type;
        }

        $this->init();
    }

    protected function init()
    {
    }

    //是否已经登录
    public function isLogin()
    {
        return !!$this->user;
    }

    /**
     * 数据库查询出来的最新用户信息
     * @return User
     */
    public function getUserInfo()
    {
        if (is_null($this->userinfo) && !$this->isLoadUserInfo) {
            $this->userinfo       = $this->userinfo();
            $this->isLoadUserInfo = true;
        }

        return $this->userinfo;
    }

    /**
     * 获取缓存的用户信息
     * @return mixed
     */
    public function getUserByCache()
    {
        return $this->user;
    }

    public function role_id()
    {
        return $this->user(__FUNCTION__) ?: 0;
    }

    public function nickname()
    {
        return $this->user(__FUNCTION__) ?: '';
    }

    public function username()
    {
        return $this->user(__FUNCTION__) ?: '';
    }

    /**
     * 获取用户ID
     * @return int|mixed
     */
    public function uid()
    {
        return $this->user['id'] ?? 0;
    }


    /**
     * 优先获取数据库的
     * @param null $key
     * @return 数据库查询出来的最新用户信息|mixed|null
     */
    protected function user($key = null)
    {
        $user = $this->userinfo ?? $this->user;

        return $key ? ($user[$key] ?? null) : $user;
    }

    //获取最新查库用户信息
    abstract protected function userinfo();

    //登出
    abstract public function logout();
}