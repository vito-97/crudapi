<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\exception\DataNotFoundException;
use app\exception\ValidateException;

class FlowCoupon extends Coupon
{
    protected $scopeType = self::FLOW_TYPE;

    protected $type = [
        'get_start_time' => 'timestamp',
        'get_end_time'   => 'timestamp',
        'use_start_time' => 'timestamp',
        'use_end_time'   => 'timestamp',
        'amount'         => 'integer',
    ];

    /**
     * 关联领取优惠券
     * @return \think\model\relation\HasMany
     */
    public function couponCard()
    {
        return $this->hasMany('FlowCouponCard', 'coupon_id');
    }

    /**
     * 流量券无需关联套餐
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
     * 流量券无需检测满减金额
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
            $value = $data['amount'] . '升流量券';
        }

        return $value;
    }
}
