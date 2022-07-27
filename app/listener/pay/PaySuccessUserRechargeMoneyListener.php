<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 10:22
 */

namespace app\listener\pay;


class PaySuccessUserRechargeMoneyListener
{
    /**
     * 支付成功回调
     * 对用户余额进行充值
     * @param $detail
     */
    public function handle($detail)
    {
        ['order' => $order] = $detail;

        //充值订单
        if ($order->is_recharge && $order->user) {
            if ($order->money > 0) {
                $order->user->money = ['inc', $order->money];
            }
            if ($order->flow > 0) {
//                $order->user->flow = ['inc', $order->flow];
                $order->user->flow = $order->flow;
            }
            if ($order->second > 0) {
                $order->user->setExpireTime($order->second);
            }
            $order->user->pay_count = ['inc', 1];
            $order->user->save();
        }
    }
}
