<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/21
 * Time: 9:39
 */

namespace app\validate;


class RegisterValidate extends BaseValidate
{
    protected $rule = [
        'captcha' => 'require|captcha',
    ];
}