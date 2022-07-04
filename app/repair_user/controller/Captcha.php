<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/21
 * Time: 9:41
 */

namespace app\repair_user\controller;


use app\logic\CaptchaLogic;

class Captcha extends BaseController
{
    protected $name = '验证码';

    protected $agentScope = false;

    protected $methodName = [
        'index' => '验证码',
    ];

    const NOT_NEED_LOGIN = ['*'];

    protected function initialize()
    {
        $this->logic = new CaptchaLogic();
    }

    public function index($key = '')
    {
        return $this->logic->verify($key);
    }
}