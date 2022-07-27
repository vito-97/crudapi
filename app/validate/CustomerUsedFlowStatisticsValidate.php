<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/26
 * Time: 10:04
 */

namespace app\validate;


class CustomerUsedFlowStatisticsValidate extends BaseValidate
{
    protected $rule = [
        'type|flow_type' => 'in:water_fetcher',
    ];


    protected $scene = [
        'flow' => ['type'],
    ];
}
