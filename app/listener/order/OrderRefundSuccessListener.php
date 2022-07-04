<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 14:31
 */

namespace app\listener\order;


use app\logic\AllInPayLogic;

class OrderRefundSuccessListener
{
    public function handle($params)
    {
        ['order' => $order] = $params;

        if ( $order->agent_id) {
            $pay  = new AllInPayLogic();
            $data = $pay->getOne(['where' => ['agent_id' => $order->agent_id, 'status' => 1]]);
            if ($data) {
                $data->inc('refund_amount', $order->refund_money)->update();
            }
        }
    }
}