<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 17:30
 */

namespace app\validate;


class ChangeCrudValidate extends BaseValidate
{
    protected $rule = [
        'id'    => 'require|checkIDArray',
        'field' => 'require|alphaDash',
        'value' => 'require',
    ];
}
