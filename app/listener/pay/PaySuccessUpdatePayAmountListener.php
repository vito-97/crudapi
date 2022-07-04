<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 14:20
 */

namespace app\listener\pay;


use app\logic\AllInPayLogic;

class PaySuccessUpdatePayAmountListener
{
    public function handle($detail)
    {
        ['order' => $order] = $detail;

        if (!empty($detail['result'])) {
            $pay  = new AllInPayLogic();
            $data = $pay->getOne(['where' => ['agent_id' => $order->getPayAgentID(), 'status' => 1]]);
            if ($data) {
                $data->inc('amount', $order->pay_price)->update();
            }
        }
    }
}