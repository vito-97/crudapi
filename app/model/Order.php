<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;


use app\common\Enum;
use app\exception\MessageException;
use app\exception\ValidateException;
use app\common\Message;
use app\model\traits\AgentTrait;
use app\model\traits\DeviceTrait;
use app\model\traits\ProductTrait;
use app\model\traits\SiteScopeTrait;
use app\model\traits\UserTrait;
use app\common\Util;
use think\db\Query;
use think\facade\Lang;
use think\Model;

class Order extends BaseModel
{
    use UserTrait, AgentTrait;
    use DeviceTrait;
    use ProductTrait;
    use SiteScopeTrait;

    protected $scene = [
        'api'    => [
            'hidden' => ['channel_trade_no', 'user_id', 'agent_id', 'product_id', 'pay_type', 'mark', 'type', 'allow_refund', 'delete_time'],
            'append' => ['is_pay', 'device', 'status_desc', 'channel_type_desc'],
        ],
        'status' => [
            'append' => ['is_pay', 'status_desc'],
            'hidden' => ['user_id'],
        ],
    ];

    //支付超时时间
    const PAY_TIMEOUT = 300;

    const STATUS_WAIT = 0;//待支付
    const STATUS_PAID = 1;//已支付
    const STATUS_CANCEL = 2;//已取消
    const STATUS_TIMEOUT = 3;//已超时
    const STATUS_WAIT_REFUND = 4;//待退款
    const STATUS_REFUND = 5;//已退款

    protected $statusEnum = [
        self::STATUS_WAIT        => Message::ORDER_STATUS['wait'],
        self::STATUS_PAID        => Message::ORDER_STATUS['paid'],
        self::STATUS_CANCEL      => Message::ORDER_STATUS['cancel'],
        self::STATUS_TIMEOUT     => Message::ORDER_STATUS['timeout'],
        self::STATUS_WAIT_REFUND => Message::ORDER_STATUS['wait_refund'],
        self::STATUS_REFUND      => Message::ORDER_STATUS['refund'],
    ];

    //用户充值
    const RECHARGE_TYPE = 1;
    //代理服务费
    const SERVICE_CHARGE_TYPE = 2;

    protected $typeEnum = [
        self::RECHARGE_TYPE       => '充值',
        self::SERVICE_CHARGE_TYPE => '服务费',
    ];

    const CHANNEL_TYPE_WX = Enum::PAY_TYPE_WX;
    const CHANNEL_TYPE_ALIPAY = Enum::PAY_TYPE_ALIPAY;
    const CHANNEL_TYPE_QQ = Enum::PAY_TYPE_QQ;
    const CHANNEL_TYPE_CARD = Enum::PAY_TYPE_CARD;
    const CHANNEL_TYPE_ADD = Enum::PAY_TYPE_ADD;

    protected $channelTypeEnum = [
        self::CHANNEL_TYPE_WX     => '微信',
        self::CHANNEL_TYPE_ALIPAY => '支付宝',
        self::CHANNEL_TYPE_QQ     => 'QQ',
        self::CHANNEL_TYPE_CARD   => '银联',
        self::CHANNEL_TYPE_ADD    => '后台添加',
    ];

    protected $readonly = ['order_no', 'user_id', 'agent_id'];

    public static function onBeforeInsert(Model $model)
    {
        if (!$model->order_no)
            $model->order_no = Util::orderNo();
    }

    public function getPayAgentID()
    {
        if ($this->getData('type') == self::SERVICE_CHARGE_TYPE) {
            return 0;
        }

        return $this->agent_id;
    }

    /**
     * 关联优惠券
     * @return \think\model\relation\BelongsTo
     */
    public function couponCard()
    {
        return $this->belongsTo('CouponCard');
    }

    /**
     * 检测是否可以支付
     * @return $this
     * @throws ValidateException
     */
    public function checkCanPay()
    {
        if ($this->is_pay) {
            throw new ValidateException('订单已支付');
        }

        if (!$this->is_wait) {
            throw new ValidateException('当前订单状态不可支付');
        }

        if ($this->is_timeout) {
            throw new MessageException('订单支付已超时');
        }

        return $this;
    }

    /**
     * 已支付
     * @return bool
     */
    protected function getIsPayAttr()
    {
        return $this->getData('status') == self::STATUS_ON;
    }

    /**
     * 待支付
     * @return bool
     */
    protected function getIsWaitAttr()
    {
        return $this->getData('status') == self::STATUS_OFF;
    }

    /**
     * 取消
     * @return bool
     */
    protected function getIsCancelAttr()
    {
        return $this->getData('status') == self::STATUS_CANCEL;
    }

    /**
     * 支付超时
     * @return bool
     */
    protected function getIsTimeoutAttr()
    {
        return $this->getData('status') == self::STATUS_TIMEOUT || $this->getData('create_time') + self::PAY_TIMEOUT < time();
    }

    /**
     * 待退款
     * @return bool
     */
    protected function getIsWaitRefundAttr()
    {
        return $this->getData('status') == self::STATUS_WAIT_REFUND;
    }

    /**
     * 是否已经退款
     * @return bool
     */
    protected function getIsRefundAttr()
    {
        return $this->getData('status') == self::STATUS_REFUND;
    }

    /**
     * 获取支付金额
     * @return float|int
     */
    protected function getPayAmountAttr()
    {
        return $this->getData('price');
    }

    /**
     * 检查订单是否可以退款
     * @return $this
     * @throws ValidateException
     */
    public function checkCanRefund()
    {
        if ($this->is_wait) {
            throw new ValidateException('订单未支付');
        }

        if (!$this->allow_refund) {
            throw new ValidateException('订单不支持退款');
        }

        if ($this->is_wait_refund) {
            throw new ValidateException('正在退款中');
        }

        if ($this->is_refund) {
            throw new ValidateException('已退款');
        }

        if (!$this->is_pay) {
            throw new ValidateException('订单不可退款');
        }

        if (!$this->is_recharge) {
            throw new ValidateException('非充值订单不可退款');
        }

        if ($this->getData('coupon_card_id')) {
            throw new ValidateException('使用了优惠券的订单不可退款');
        }

        if (bccomp($this->getData('money'), $this->getData('pay_price')) === 1) {
            throw new ValidateException('优惠套餐不可退款');
        }

        return $this;
    }

    /**
     * 是否为充值订单
     * @return bool
     */
    protected function getIsRechargeAttr()
    {
        return $this->getData('type') == self::RECHARGE_TYPE;
    }

    /**
     * 判断是否可以充值
     * @return bool
     */
    protected function getCanRechargeAttr()
    {
        return $this->is_pay && !$this->getData('is_recharged');
    }

    /**
     * 套餐快照获取器
     * @param $value
     * @return mixed
     */
    protected function getProductSnapAttr($value)
    {
        if ($value && is_string($value)) {
            $value = json_decode($value, true);
        }

        return $value;
    }

    protected function getChannelTypeDescAttr($value, $data)
    {
        return $this->getEnumDesc('channel_type', $data);
    }

    protected function getPayTimeAttr($value)
    {
        return $this->_getTimeAttr($value);
    }

    public function searchOrderNoAttr(Query $query, $value)
    {
        return $query->whereOr('order_no', $value);
    }

    public function searchOuterTradeNoAttr(Query $query, $value)
    {
        return $query->whereOr('outer_trade_no', $value);
    }

    public function searchChannelTradeNoAttr(Query $query, $value)
    {
        return $query->whereOr('order_no', $value);
    }

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('order_no|outer_trade_no|channel_trade_no', 'like', "%{$value}%");
    }
}