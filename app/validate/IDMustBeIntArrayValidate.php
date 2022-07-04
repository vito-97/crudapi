<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/27
 * Time: 11:13
 */

namespace app\validate;


class IDMustBeIntArrayValidate extends BaseValidate
{
    protected $rule = [
        'id|ID' => 'require|checkIDArray',
    ];
}