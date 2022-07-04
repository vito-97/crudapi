<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:29
 */

namespace app\model;


use app\common\Enum;
use app\common\Message;
use app\exception\DataNotFoundException;
use app\exception\ValidateException;
use app\logic\CouponCardLogic;
use app\model\traits\AgentTrait;
use app\model\traits\CouponScopeTrait;
use app\model\traits\CouponTrait;
use app\model\traits\ProductTrait;
use think\Model;

class Coupon extends BaseModel
{
    use AgentTrait, CouponTrait, CouponScopeTrait, ProductTrait;

    protected $name = 'coupon';

    //类型
    protected $scopeType = self::COUPON_TYPE;

    protected $readonly = [];

    const COUPON_TYPE = 1;
    const CASH_TYPE = 2;

    const TYPE_ENUM = [
        self::COUPON_TYPE => '优惠券',
        self::CASH_TYPE   => '现金券',
    ];

    const ALL_LIMIT_TYPE = 1;
    const DAY_LIMIT_TYPE = 2;
    const MONTH_LIMIT_TYPE = 3;
    const YEAR_LIMIT_TYPE = 4;

    protected $limitTypeEnum = [
        self::ALL_LIMIT_TYPE   => '所有',
        self::DAY_LIMIT_TYPE   => '每天',
        self::MONTH_LIMIT_TYPE => '每月',
        self::YEAR_LIMIT_TYPE  => '每年',
    ];

    const LIMIT_TYPE_TIME = [
        self::DAY_LIMIT_TYPE   => 'today',
        self::MONTH_LIMIT_TYPE => 'month',
        self::YEAR_LIMIT_TYPE  => 'year',
    ];

    protected $typeEnum = self::TYPE_ENUM;

    //失效状态
    const STATUS_DISABLED = 2;
    //是否为无限张
    const IS_INFINITE = 1;
    //状态字段
    protected $statusEnum = [
        self::STATUS_OFF      => Message::STATUS_OFF,
        self::STATUS_ON       => Message::STATUS_ON,
        self::STATUS_DISABLED => Message::STATUS_DISABLED,
    ];

    //开关
    protected $isInfiniteEnum = self::SWITCH_ENUM;

    //全局查询范围
    protected $globalScope = [
        'type',
    ];

    protected $type = [
        'get_start_time' => 'timestamp',
        'get_end_time'   => 'timestamp',
        'use_start_time' => 'timestamp',
        'use_end_time'   => 'timestamp',
    ];

    /**
     * 更新事件
     * @param Model $model
     */
    public static function onAfterUpdate(Model $model): void
    {
        if ($model->getData('status')) {

            switch ((int)$model->getData('status')) {
                //失效
                case self::STATUS_DISABLED:
                    $model->couponCard()->where('is_use', self::SWITCH_OFF)->update(['status' => CouponCard::STATUS_OFF]);
                    break;
                //启用
                case self::STATUS_ON:
//                    $model->couponCard()->where('status', CouponCard::STATUS_OFF)->where('is_use', self::SWITCH_OFF)->update(['status' => CouponCard::STATUS_ON]);
                    break;
            }

        }

        //批量更新数据
        if ($model->coupon_user_id) {
            CouponCard::update(['coupon_user_id' => $model->coupon_user_id], ['coupon_id' => $model->id]);
        }
    }

    /**
     * 关联优惠券管理员
     * @return \think\model\relation\BelongsTo
     */
    public function couponUser()
    {
        return $this->belongsTo('CouponUser', 'coupon_user_id');
    }

    /**
     * 关联领取优惠券
     * @return \think\model\relation\HasMany
     */
    public function couponCard()
    {
        return $this->hasMany('CouponCard');
    }

    /**
     * 领取优惠券
     * @param CouponCard $couponCardModel
     * @param bool $check
     * @return $this
     * @throws ValidateException
     */
    public function receive(CouponCard $couponCardModel, $check = true)
    {
        $this->checkModelData();

        if ($check) {
            $this->checkReceiveStatus()->checkLimit($couponCardModel->user_id)->checkHas();
        }

        $couponCardModel->expire_time = $this->getCouponExpireTime();

        $couponCardModel->coupon->inc('issued_total', 1)->update();

        return $this;
    }

    /**
     * 移除使用
     * @return $this
     */
    public function removeUse()
    {
        $this->checkModelData();

        $this->dec('issued_total', 1)->update();

        return $this;
    }

    /**
     * 获取优惠券过期时间
     * @return float|int|mixed
     */
    protected function getCouponExpireTime()
    {
        $time = 0;
        if ($this->getData('use_end_time')) {
            $time = $this->getData('use_end_time');
        } elseif ($this->getData('coupon_day')) {
            $time = $this->getData('coupon_day') * Enum::ONE_DAY_TIME + time();
        }

        return $time;
    }

    /**
     * 检测优惠券领取状态
     * @return $this
     * @throws ValidateException
     */
    public function checkReceiveStatus()
    {
        $type = $this->type_desc;

        if ($this->getData('status') === self::STATUS_OFF) {
            throw new ValidateException($type . '已关闭领取通道');
        }

        if ($this->getData('status') === self::STATUS_DISABLED) {
            throw new ValidateException($type . '已失效，不可领取');
        }

        if ($this->getData('get_start_time') && $this->getData('get_start_time') > time()) {
            throw new ValidateException($type . '领取开始时间为：' . date('Y-m-d H:i', $this->getData('get_start_time')));
        }

        if ($this->getData('get_end_time') && $this->getData('get_end_time') < time()) {
            throw new ValidateException($type . '已停止领取');
        }

        return $this;
    }

    /**
     * 检测优惠券是否可以使用
     * @param object $product 套餐
     * @throws DataNotFoundException
     * @throws ValidateException
     */
    public function checkCanUse($product = null)
    {
        $this->checkUseStatus()
            ->checkProductCanUse($product)
            ->checkFullMinus($product);
    }

    /**
     * 检测优惠券状态
     * @return $this
     * @throws ValidateException
     */
    public function checkUseStatus()
    {
        $type = $this->type_desc;
        if ($this->getData('status') == self::STATUS_DISABLED) {
            throw new ValidateException($type . '已不可使用');
        }
        $startTime = $this->getData('use_start_time');
        $endTime   = $this->getData('use_end_time');
        if ($startTime && $startTime > time()) {
            $msg = $type . '开始使用时间为' . date($this->_dateFormat, $startTime) . ($endTime ? '~' . date($this->_dateFormat) : '');
            throw new ValidateException($msg);
        }

        if ($this->getData('use_end_time') && $this->getData('use_end_time') < time()) {
            throw new ValidateException($type . '已过期');
        }

        return $this;
    }

    /**
     * 检测产品
     * @param $product
     * @return $this
     * @throws DataNotFoundException
     * @throws ValidateException
     */
    public function checkProductCanUse($product)
    {
        $type = $this->type_desc;

        if (!$product) {
            throw new DataNotFoundException('套餐不存在');
        }

        $productID = is_numeric($product) ? $product : $product->id;

        if ($this->getData('product_id') && $this->getData('product_id') != $productID) {
            throw new ValidateException($type . '不能使用到该套餐');
        }

        return $this;
    }

    /**
     * 检测满减金额
     * @param $product
     * @return $this
     * @throws ValidateException
     */
    public function checkFullMinus($product)
    {
        $type = $this->type_desc;

        if ($this->getData('full_minus') && bccomp($this->getData('full_minus'), $product->price) === 1) {
            throw new ValidateException('未到满减金额，' . $type . '不可使用');
        }

        return $this;
    }

    /**
     * 检测优惠券数量
     * @return $this
     * @throws ValidateException
     */
    public function checkHas()
    {
        $type = $this->type_desc;

        if (!$this->getData('is_infinite') && $this->getData('issued_total') > $this->getData('total')) {
            throw new ValidateException($type . '已被领取完');
        }

        return $this;
    }

    /**
     * 检测优惠券领取限制数量
     * @param $user_id
     * @return $this
     * @throws ValidateException
     */
    public function checkLimit($user_id)
    {
        $type = $this->type_desc;

        if ($this->getData('limit')) {
            $couponCardLogic = new CouponCardLogic();
            $limitType       = $this->getData('limit_type');
            $time            = self::LIMIT_TYPE_TIME[$limitType] ?? '';

            $count = $couponCardLogic->countByUserID($this->getData('id'), $user_id, $time);

            if ($count >= $this->getData('limit')) {
                $msg = $type . '已经领取上限';

                if ($limitType != 1) {
                    $msg .= $this->limit_type_desc . "/{$this->getData('limit')}张";
                }

                throw new ValidateException($msg);
            }
        }

        return $this;
    }

    /**
     * 减去优惠
     * @param $money
     * @return string
     */
    public function subMoney($money)
    {
        $num = bcsub($money, $this->getData('amount'),2);

        if ($num <= 0) {
            $num = Enum::PRICE_ZERO_DEFAULT;
        }

        return $num;
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
            if ($data['full_minus']) {
                $value = '满' . $data['full_minus'] . '减' . $data['amount'] . '优惠券';
            } else {
                $value = '立减' . $data['amount'] . '优惠券';
            }
        }

        return $value;
    }

    protected function setGetTimeAttr($value)
    {
        if (is_array($value) && count($value) === 2) {
            $this->get_start_time = $this->_setTimeAttr($value[0], 'start');
            $this->get_end_time   = $this->_setTimeAttr($value[1], 'end');
        }
        return $value;
    }

    protected function setUseTimeAttr($value)
    {
        if (is_array($value) && count($value) === 2) {
            $this->use_start_time = $this->_setTimeAttr($value[0], 'start');
            $this->use_end_time   = $this->_setTimeAttr($value[1], 'end');
        }
        return $value;
    }

    protected function getLimitTypeDescAttr($value, $data)
    {
        return $this->getEnumDesc('limit_type', $data);
    }
}