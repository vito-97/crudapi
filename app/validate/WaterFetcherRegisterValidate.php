<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/23
 * Time: 11:18
 */

namespace app\validate;


class WaterFetcherRegisterValidate extends UserValidate
{
    protected $rule = [
        'tel'       => 'require|' . self::RULE['tel'],
        'password'  => self::RULE['password'],
        'real_name' => 'require|' . self::RULE['real_name'],
    ];
}
