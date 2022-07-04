<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/13
 * Time: 11:07
 */

namespace app\validate;


class TimeTypeValidate extends BaseValidate
{
    protected $rule = [
        'type|time_type' => 'require|in:day,week,month,year',
    ];
}