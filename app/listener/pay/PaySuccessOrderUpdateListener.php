<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/7
 * Time: 15:10
 */

namespace app\listener\pay;


use app\logic\PayLogic;

class PaySuccessOrderUpdateListener
{
    /**
     * 支付成功回调
     * @param $detail
     */
    public function handle($detail)
    {
        ['order' => $order] = $detail;

        //转换参数
        $logic      = new PayLogic();
        $payService = $logic->payService(0);
        $result     = $payService->formatBackArgs($detail['result'] ?? []);

        if (empty($order->channel_trade_no))
            $order->channel_trade_no = $result['channel_trade_no'] ?? '';
        if (empty($order->outer_trade_no))
            $order->outer_trade_no = $result['outer_trade_no'] ?? $order->order_no;
        $order->channel_type = $result['channel_type'] ?? 'add';
        $order->pay_time     = strtotime($result['pay_time'] ?? $order->create_time);
        $order->status       = $order::STATUS_ON;
        $order->is_recharged = 1;
        $order->save();
    }

}