<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/30
 * Time: 16:19
 */

namespace app\listener\order;


use app\common\EventName;
use app\exception\MessageException;
use app\model\Order;
use app\service\PayService;
use think\facade\Event;

class OrderRefundListener
{
    public function handle($params)
    {
        $order = $params['order'];

        $service = new PayService($order->getPayAgentID());
        $pay     = $service->driver();

        try {
            $result = $pay->refund(['order_no' => $order->order_no, 'amount' => $order->refund_money]);
            dump($result);
            $code   = $pay->getPayStatus($result);
            $status = $pay->payIsSuccess($result);
            if ($status && $code === 'refund') {
                $order->status = Order::STATUS_REFUND;
                $order->save();

                $args = ['order' => $order];
                Event::trigger(EventName::ORDER_REFUND_SUCCESS, $args);
            } else {
                $args = ['order' => $order, 'msg' => $result['msg'] ?? '退款失败'];
                Event::trigger(EventName::ORDER_REFUND_ERROR, $args);
            }
        } catch (MessageException $e) {
            $args = ['order' => $order, 'msg' => $e->getMessage()];
            Event::trigger(EventName::ORDER_REFUND_ERROR, $args);
        }

    }
}