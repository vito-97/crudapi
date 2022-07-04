<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/7
 * Time: 17:12
 */

namespace app\model;


class CashCouponCard extends CouponCard
{
    protected $scopeType = self::CASH_TYPE;

    /**
     * 关联优惠券
     * @return \think\model\relation\BelongsTo
     */
    public function coupon()
    {
        return $this->belongsTo('CashCoupon', 'coupon_id');
    }
}