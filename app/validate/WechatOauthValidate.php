<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/1
 * Time: 16:16
 */

namespace app\validate;


class WechatOauthValidate extends BaseValidate
{
    protected $rule = [
        'scope|wechat_oauth_scope' => 'require|in:base,userinfo',
        'code|wechat_oauth_code'   => 'require',
    ];

    protected $scene = [
        'scope' => ['scope'],
        'code'  => ['code'],
    ];
}
