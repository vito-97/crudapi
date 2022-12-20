<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:06
 */

namespace app\api\controller;

use app\logic\UserLogic;

class Login extends BaseController
{
    protected $name = '登录';

    protected $methodName = [
        'tourist' => '游客登录',
        'logout'  => '登出',
    ];

    protected function initialize()
    {
        $this->logic = new UserLogic();
    }

    //游客登录
    public function tourist()
    {
        $user = $this->logic->touristLogin();

        return success($user);
    }

    public function logout()
    {
        $this->logic->logout();

        return success();
    }
}