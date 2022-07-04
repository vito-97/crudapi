<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:51
 */

namespace app\coupon_user\curd;


trait CouponScopeTrait
{
    protected $globalScope = [];

    protected function globalScope()
    {
        return ['couponUser' => $this->request->user->uid()];
    }
}