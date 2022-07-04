<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/16
 * Time: 14:45
 */

namespace app\validate;


class DeviceNoValidate extends BaseValidate
{
    protected $rule = [
        'device_no' => 'require|alphaNum|max:10',
    ];
}