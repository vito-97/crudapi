<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\exception\DataNotFoundException;
use app\exception\ValidateException;

class CashCoupon extends Coupon
{
    protected $scopeType = self::CASH_TYPE;

    /**
     * 关联领取优惠券
     * @return \think\model\relation\HasMany
     */
    public function couponCard()
    {
        return $this->hasMany('CashCouponCard', 'coupon_id');
    }

    /**
     * 现金券无需关联套餐
     * @param $product
     * @return $this
     * @throws DataNotFoundException
     * @throws ValidateException
     */
    public function checkProductCanUse($product)
    {
        return $this;
    }

    /**
     * 现金券无需检测满减金额
     * @param $product
     * @return $this
     * @throws ValidateException
     */
    public function checkFullMinus($product)
    {
        return $this;
    }

    /**
     * 设置名称
     * @param $value
     * @param $data
     * @return mixed|string
     */
    protected function setNameAttr($value, $data)
    {
        if (empty($value)) {
            $value = $data['amount'] . '元现金券';
        }

        return $value;
    }
}
