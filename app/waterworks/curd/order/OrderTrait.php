<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 11:22
 */

namespace app\waterworks\curd\order;

use app\common\EventName;
use think\facade\Db;
use think\facade\Event;

trait OrderTrait
{
    /**
     * 触发订单事件
     * @param $order
     */
    protected function triggerOrderEvent($order)
    {
        Db::transaction(function () use ($order) {

            Event::trigger(EventName::CREATE_ORDER, $order);

            if ($order->can_recharge) {
                Event::trigger(EventName::PAY_SUCCESS, ['order' => $order]);
            }

        });
    }
}