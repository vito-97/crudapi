<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/14
 * Time: 11:18
 */

namespace app\listener\order;


class CreateOrderListener
{
    /**
     * 生成订单事件
     * @param $order
     */
    public function handle($order)
    {
        if ($order->coupon_card_id) {
            $couponCard = $order->coupon_card;

            if ($couponCard) {
                $couponCard->setUsed();
            }
        }
    }
}