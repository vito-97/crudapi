<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/30
 * Time: 10:09
 */

namespace app\validate;


class UsedFlowStatisticsValidate extends BaseValidate
{
    protected $rule = [
        'type|flow_type' => 'in:waterworks,device,customer',
    ];


    protected $scene = [
        'flow' => ['type'],
    ];
}