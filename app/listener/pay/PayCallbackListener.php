<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/7
 * Time: 14:31
 */

namespace app\listener\pay;


class PayCallbackListener
{
    public function handle($detail)
    {
        ['order' => $order, 'result' => $result] = $detail;

        //更新第三方支付的订单号
        if(!$order->outer_trade_no){
            $order->outer_trade_no = $result['outer_trade_no'];
            $order->save();
        }
    }
}