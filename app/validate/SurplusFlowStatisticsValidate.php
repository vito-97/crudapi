<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/30
 * Time: 14:46
 */

namespace app\validate;


class SurplusFlowStatisticsValidate extends BaseValidate
{
    protected $rule = [
        'type' => 'in:customer',
    ];
}