<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:06
 */

namespace app\customer\controller;

use app\logic\CustomerLogic;
use app\service\TokenService;
use app\validate\UserValidate;

class Login extends BaseController
{
    protected $name = '登录';

    protected $agentScope = false;

    const NOT_NEED_LOGIN = ['login'];

    protected $methodName = [
        'logout' => '登出',
    ];

    protected function initialize()
    {
        $this->logic = new CustomerLogic();
    }

    public function login()
    {
        UserValidate::batchCheck('login');

        ['username' => $username, 'password' => $password] = UserValidate::getDataByRule('login');

        $user = $this->logic->login($username, $password, TokenService::CUSTOMER);

        return success($user);
    }

    public function logout()
    {
        $this->logic->logout();

        return success();
    }
}