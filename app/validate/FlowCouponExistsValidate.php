<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/1
 * Time: 14:58
 */

namespace app\validate;


class FlowCouponExistsValidate extends BaseValidate
{
    protected $rule = [
        'id|flow_coupon_id' => 'require|isPositiveInteger|checkHas:flow_coupon',
    ];
}
