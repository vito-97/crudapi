<?php

namespace app;

// 应用请求对象类
class Request extends \think\Request
{
    protected $user;

    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    public function getUser()
    {
        return $this->user;
    }
}
