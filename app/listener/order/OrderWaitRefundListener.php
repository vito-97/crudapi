<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/25
 * Time: 11:51
 */

namespace app\listener\order;


use app\common\Enum;
use app\exception\MessageException;
use app\job\OrderRefundJob;
use app\model\Order;
use think\facade\Db;
use think\facade\Queue;

class OrderWaitRefundListener
{
    public function handle($params)
    {
        $order       = $params['order'];
        $reason      = isset($params['refund_mark']) ? $params['refund_mark'] : '';
        $refundMoney = isset($params['refund_money']) ? $params['refund_money'] : 0;

        if ($refundMoney <= 0) {
            throw new MessageException('退款金额不能为0元');
        }
        Db::transaction(function () use ($order, $refundMoney, $reason) {
            $order->status       = Order::STATUS_WAIT_REFUND;
            $order->refund_money = $refundMoney;
            if ($reason) {
                $order->refund_mark = $reason;
            }

            $order->save();
            $msg = ['order_id' => $order->id];

            //加入队列去操作退款
            Queue::push(OrderRefundJob::class, $msg, Enum::JOB_ORDER_REFUND);
        });


    }
}