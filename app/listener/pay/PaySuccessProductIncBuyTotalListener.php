<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 10:23
 */

namespace app\listener\pay;


class PaySuccessProductIncBuyTotalListener
{
    /**
     * 支付成功回调
     * 对订单购买记录自增
     * @param $detail
     */
    public function handle($detail)
    {
        ['order' => $order] = $detail;

        //充值订单
        if ($order->is_recharge && $order->product) {
            //递增
            $order->product->incBuyTotal();
        }
    }
}