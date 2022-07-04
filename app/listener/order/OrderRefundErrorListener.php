<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/6
 * Time: 17:25
 */

namespace app\listener\order;


use app\model\Order;
use think\facade\Db;

class OrderRefundErrorListener
{
    public function handle($params)
    {
        /**
         * @var Order $order
         */
        $order = $params['order'];
        $msg   = $params['msg'];

        Db::transaction(function () use ($order, $msg) {
            //更新订单状态
            $order->status            = Order::STATUS_PAID;
            $order->refund_money      = 0;
            $order->refund_error_mark = $msg;
            $order->save();
        });

    }
}