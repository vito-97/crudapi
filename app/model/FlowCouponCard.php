<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/7
 * Time: 17:12
 */

namespace app\model;


use think\Model;

class FlowCouponCard extends CouponCard
{
    protected $scopeType = self::FLOW_TYPE;

    protected $type = [];

    /**
     * 关联优惠券
     * @return \think\model\relation\BelongsTo
     */
    public function coupon()
    {
        return $this->belongsTo('FlowCoupon', 'coupon_id');
    }

    public static function onBeforeInsert(Model $model)
    {
        parent::onBeforeInsert($model);

        if (empty($model->use_time)) {
            $model->use_time = time();
        }

        $model->is_use = self::SWITCH_ON;
    }
}
