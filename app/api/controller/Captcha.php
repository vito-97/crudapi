<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/27
 * Time: 18:35
 */

namespace app\api\controller;

use app\logic\CaptchaLogic;

class Captcha extends BaseController
{
    protected function initialize()
    {
        $this->logic = new CaptchaLogic();
    }

    public function index($key = '')
    {
        return $this->logic->verify($key);
    }
}
