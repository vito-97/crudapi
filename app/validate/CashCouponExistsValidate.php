<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/1
 * Time: 14:58
 */

namespace app\validate;


class CashCouponExistsValidate extends BaseValidate
{
    protected $rule = [
        'id|cash_coupon_id' => 'require|isPositiveInteger|checkHas:cash_coupon',
    ];
}
