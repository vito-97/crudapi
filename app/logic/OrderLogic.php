<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:37
 */

namespace app\logic;


use app\common\Enum;
use app\common\EventName;
use app\exception\DataNotFoundException;
use app\exception\MessageException;
use app\model\DeviceControl;
use app\model\Order;
use app\model\ServiceCharge as ServiceChargeModel;
use think\facade\Event;

class OrderLogic extends BaseLogic
{
    //计算金额的字段
    const SUM_MONEY_FIELD = '`pay_price` - `refund_money`';

    protected function getModelName()
    {
        return Order::class;
    }

    /**
     * 统计金额
     * @param int $num
     * @param string $type
     * @return mixed
     */
    public function sumMoney($num = 0, $type = 'day')
    {
        return (float)$this->sumTotal(self::SUM_MONEY_FIELD, $this->statisticsWhere(), $num, $type);
    }

    /**
     * 统计订单数
     * @param int $num
     * @param string $type
     * @return mixed
     */
    public function countOrder($num = 0, $type = 'day')
    {
        return $this->countTotal($this->statisticsWhere(), $num, $type);
    }

    /**
     * 统计一周的订单数
     * @param int $n
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function countOrderListByDay($n = 7, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->countByDay($this->statisticsWhere(), $args);
    }

    /**
     * 统计几周的订单数
     * @param int $n
     * @param int $now
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function countOrderListByWeek($n = 15, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->countByWeek($this->statisticsWhere(), $args);
    }

    /**
     * 统计每月的订单数
     * @param int $n
     * @param array $args
     * @return array
     */
    public function countOrderListByMonth($n = 12, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->countByMonth($this->statisticsWhere(), $args);
    }

    /**
     * 统计每年的订单数
     * @param int $n
     * @param array $args
     * @return array
     */
    public function countOrderListByYear($n = 12, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->countByYear($this->statisticsWhere(), $args);
    }

    /**
     * 统计一周的订单金额
     * @param int $n
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function sumMoneyListByDay($n = 7, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->sumByDay(self::SUM_MONEY_FIELD, $this->statisticsWhere(), $args);
    }

    /**
     * 统计几周的订单金额
     * @param int $n
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function sumMoneyListByWeek($n = 15, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->sumByWeek(self::SUM_MONEY_FIELD, $this->statisticsWhere(), $args);
    }

    /**
     * 统计每月的订单金额
     * @param int $n
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function sumMoneyListByMonth($n = 12, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->sumByMonth(self::SUM_MONEY_FIELD, $this->statisticsWhere(), $args);
    }

    /**
     * 统计每年的订单金额
     * @param int $n
     * @param array $args
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function sumMoneyListByYear($n = 10, $args = [])
    {
        $default = [
            'num' => $n,
        ];
        $args    = array_merge($default, $args);
        return $this->sumByYear(self::SUM_MONEY_FIELD, $this->statisticsWhere(), $args);
    }

    /**
     * 统计的条件
     * @return array[]
     */
    public function statisticsWhere()
    {
        return [
            ['status', 'IN', [Order::STATUS_PAID, Order::STATUS_WAIT_REFUND, Order::STATUS_REFUND]],
            ['type', '=', Order::RECHARGE_TYPE],
        ];
    }

    /**
     * 获取订单信息
     * @param $orderNo
     * @return mixed
     * @throws DataNotFoundException
     */
    public function getOrderByNo($orderNo)
    {
        $model = $this->getModel();

        $order = $model->getByOrderNo($orderNo);

        if (!$order) {
            throw new DataNotFoundException('订单不存在');
        }

//        if ($this->user && $this->user->uid() != $order->user_id) {
//            throw new DataNotFoundException('订单不存在');
//        }

        return $order;
    }

    /**
     * 获取订单状态
     * @param $orderNo
     * @return \app\model\BaseModel|array|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getOrderStatus($orderNo)
    {
        $model = $this->getModel();

        $status = $model->where('order_no', $orderNo)->field(['id', 'status', 'user_id'])->find();

        return $status;
    }

    /**
     * 生成订单
     * @param $params
     * @return \app\model\BaseModel|false
     * @throws DataNotFoundException
     */
    public function createOrder($params)
    {
        $userID = $this->request->user->uid();

        $device = (new DeviceLogic())->getID($params['device_id']);

        //检测机器是否可以使用
        $deviceControlLogic = new DeviceControlLogic();
        $deviceControlLogic->checkCanControl($device, DeviceControl::STATE_WAIT);

        $couponCardID = $params['coupon_card_id'] ?? 0;

        //没有使用优惠券
        //查询是否有待支付的订单
        if (!$couponCardID) {
            $detail = $this->getWaitPayOrderByProduct($params['product_id'], $userID);

            if ($detail)
                return $detail;
        }

        //获取套餐
        $productLogic = new ProductLogic();
        $product      = $productLogic->getProductByID($params['product_id']);

        $payPrice = $product->price;
        $money    = $product->price;
        //有传入优惠券
        if ($couponCardID) {
            $couponCardLogic = new CashCouponCardLogic();
            $couponCard      = $couponCardLogic->getCouponCardByID($couponCardID, $userID);

            //检测优惠券是否可以使用
            $couponCard->checkCanUse($product);

            $payPrice = $couponCard->coupon->subMoney($payPrice);
        }

        $order = [
            'title'          => $product->name,
            'product_id'     => $product->id,
            'user_id'        => $userID,
            'agent_id'       => $product->agent_id,
            'product_snap'   => $product->visible(['name', 'price', 'flow', 'give_flow', 'allow_refund', 'is_vip'])->toJson(),
            'coupon_card_id' => $couponCardID,
            'pay_type'       => config('web.payment.default'),
            'price'          => $product->price,
            'pay_price'      => $payPrice,
            'money'          => 0,
            'flow'           => $product->all_flow,
            'device_id'      => $params['device_id'],
            'site_id'        => $device->site_id,
//            'allow_refund'     => ($couponCardID || bccomp($money, $payPrice) === 1) ? 0 : 1,//判断是否可以退款
            'allow_refund'   => $product->allow_refund,//判断是否可以退款
            'is_recharged'   => 0,
            'is_vip'         => $product->is_vip,
        ];

        $detail = $this->add($order);

        if ($detail) {
            Event::trigger(EventName::CREATE_ORDER, $detail);
        }

        return $detail;
    }

    /**
     * 生成代理缴费订单
     * @param $userID
     * @param string|int $serviceChargeId 服务费ID
     * @return \app\model\BaseModel|false
     */
    public function createAgentPayOrder($userID, $serviceChargeId)
    {
        $amount = 0;

        $result = ServiceChargeModel::where('is_pay', Enum::SWITCH_OFF)->where('id', 'IN', $serviceChargeId)->select();

        if ($result->isEmpty()) {
            throw new MessageException('没有需要支付的服务费');
        }

        $ids = $result->column('id');

        foreach ($result as $item) {
            $amount = bcadd($amount, $item->amount, 2);
        }

        $detail = $this->getWaitPayOrderByServiceChargeId($ids, $userID);

        if ($detail) {
            return $detail;
        }

        $order = [
            'title'       => $result[0]->title,
            'agent_id'    => $userID,
            'user_id'     => $userID,
            'device_id'   => $result[0]->device_id,
            'pay_type'    => config('web.payment.default'),
            'price'       => $amount,
            'pay_price'   => $amount,
            'type'        => Order::SERVICE_CHARGE_TYPE,
            'extend_data' => join(',', $ids),
        ];

        $count = count($ids);

        if ($count > 1) {
            $order['title'] .= '等' . ($count - 1) . '条服务费';
        }

        $detail = $this->add($order);

        return $detail;
    }

    /**
     * @param $productID
     * @param int $userID
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getWaitPayOrderByProduct($productID, $userID = 0)
    {
        $model = $this->getModel();
        $map   = [
            'product_id' => $productID,
            'user_id'    => $userID,
        ];
        return $model->where($map)
            ->whereBetweenTime('create_time', time() - $model::PAY_TIMEOUT, time())
            ->where('status', $model::STATUS_WAIT)
            ->find();
    }

    /**
     * @param $ids 服务费ID
     * @param int $userID
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getWaitPayOrderByServiceChargeId($ids, $userID = 0)
    {
        if (is_array($ids)) {
            sort($ids);
            $ids = join(',', $ids);
        }
        $model = $this->getModel();
        $map   = [
            'extend_data' => $ids,
            'user_id'     => $userID,
            'type'        => Order::SERVICE_CHARGE_TYPE,
        ];
        return $model->where($map)
            ->whereBetweenTime('create_time', time() - $model::PAY_TIMEOUT, time())
            ->where('status', $model::STATUS_WAIT)
            ->find();
    }
}