<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:29
 */

namespace app\model;

use app\common\Message;
use app\exception\MessageException;
use app\exception\ValidateException;
use app\model\traits\AgentTrait;
use app\model\traits\CouponScopeTrait;
use app\model\traits\UserTrait;
use think\Model;

class CouponCard extends BaseModel
{
    use UserTrait, AgentTrait, CouponScopeTrait;

    protected $name = 'coupon_card';

    protected $scopeType = self::COUPON_TYPE;

    //只读字段
    protected $readonly = [
        'coupon_id',
    ];

    const STATUS_EXPIRED = 2;

    protected $statusEnum = [
        self::STATUS_OFF     => Message::STATUS_OFF,
        self::STATUS_ON      => Message::STATUS_ON,
        self::STATUS_EXPIRED => Message::STATUS_EXPIRED,
    ];

    const COUPON_TYPE = Coupon::COUPON_TYPE;
    const CASH_TYPE = Coupon::CASH_TYPE;
    const FLOW_TYPE = Coupon::FLOW_TYPE;

    protected $typeEnum = Coupon::TYPE_ENUM;

    protected $type = [
        'expire_time' => 'timestamp',
    ];

    //全局查询范围
    protected $globalScope = [
        'type',
    ];

    /**
     * 关联优惠券
     * @return \think\model\relation\BelongsTo
     */
    public function coupon()
    {
        return $this->belongsTo('Coupon');
    }

    /**
     * 关联订单
     * @return \think\model\relation\HasOne
     */
    public function trade()
    {
        return $this->hasOne('Order');
    }

    /**
     * 插入之前的事件
     * @param Model $model
     * @return mixed|void
     */
    public static function onBeforeInsert(Model $model)
    {
        $coupon = $model->coupon;

        if (!$coupon) {
            throw new MessageException('找不到' . $model->type_desc);
        }

        //领取优惠券
        $coupon->receive($model, app()->http->getName() !== 'admin');
        $model->agent_id       = $coupon->agent_id;
        $model->coupon_user_id = $coupon->coupon_user_id;
    }

    /**
     * 删除之后的事件
     * @param Model $model
     */
    public static function onAfterDelete(Model $model): void
    {
        //未使用的将优惠券的使用数量减一
        if (!$model->is_use)
            if ($model->coupon && !$model->coupon->delete_time)
                $model->coupon->removeUse();
    }

    /**
     * 设置已经是过期的状态
     * @return $this
     * @throws ValidateException
     */
    public function setExpired()
    {
        $this->checkModelData();

        if ($this->getData('expire_time') && $this->getData('expire_time') < time() && $this->getData('status') !== self::STATUS_EXPIRED) {
            $this->status = self::STATUS_EXPIRED;
            $this->save();
        }

        return $this;
    }

    /**
     * 判断是否可以使用
     * @param int|object $product
     * @return $this
     * @throws ValidateException
     */
    public function checkCanUse($product)
    {
        $this->checkStatus();
        $this->checkExpire();

        $this->coupon->checkCanUse($product);

        return $this;
    }


    /**
     * 检测状态
     * @return $this
     * @throws ValidateException
     */
    public function checkStatus()
    {
        $type = $this->type_desc;
        if ($this->getData('status') == self::STATUS_OFF) {
            throw new ValidateException($type . '不可使用');
        }

        if ($this->getData('status') == self::STATUS_EXPIRED) {
            throw new ValidateException($type . '已经过期失效');
        }

        if ($this->getData('is_use') == self::SWITCH_ON) {
            throw new ValidateException($type . '已经使用');
        }

        return $this;
    }

    /**
     * 检测过期时间
     * @return $this
     * @throws ValidateException
     */
    public function checkExpire()
    {
        if ($this->getData('expire_time') && $this->getData('expire_time') < time()) {
            $this->setExpired();
            throw new ValidateException($this->type_desc . '已经过期');
        }

        return $this;
    }

    /**
     * 设置成已使用
     * @return $this
     */
    public function setUsed()
    {
        $this->is_use = self::SWITCH_ON;
        $this->save();

        return $this;
    }
}
