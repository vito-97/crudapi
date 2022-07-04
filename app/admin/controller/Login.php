<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 15:07
 */

namespace app\admin\controller;


use app\common\Hash;
use app\logic\AdminLogic;
use app\validate\AdminValidate;

class Login extends BaseController
{
    protected $name = '登录';

    protected $methodName = [
        'login'  => '后台登录',
        'logout' => '后台登出',
    ];

    protected function initialize()
    {
        $this->logic = new AdminLogic();
    }

    public function login()
    {
        AdminValidate::batchCheck('login');

        ['username' => $username, 'password' => $password] = AdminValidate::getDataByRule('login');

        $user = $this->logic->login($username, $password);

        return success($user);
    }

    public function logout()
    {
        $this->logic->logout();

        return success();
    }
}