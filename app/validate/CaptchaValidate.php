<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/21
 * Time: 9:51
 */

namespace app\validate;


use app\service\CaptchaService;
use think\facade\App;

class CaptchaValidate extends BaseValidate
{
    protected $rule = [
        'key|verify_key' => 'require|alphaNum|length:15,30',
        'captcha'        => 'require|alphaNum|checkCaptcha',
    ];

    protected $scene = [
        'show' => ['key'],
    ];

    protected function checkCaptcha($value, $rule = '', $data = [])
    {
        if (!empty($data['key'])) {
            $captcha = App::getInstance()->invokeClass(CaptchaService::class, [$data['key']]);
            $status  = $captcha->check($value);

            if ($status) {
                return true;
            }
        }

        return ':attribute错误';
    }
}