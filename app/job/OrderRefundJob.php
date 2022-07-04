<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 15:59
 */

namespace app\job;

use app\common\EventName;
use app\model\Order;
use think\facade\Event;
use think\queue\Job;

class OrderRefundJob extends BaseJob
{
    public function __construct()
    {
    }

    protected function execute($data, Job $job): bool
    {
        if (!empty($data['order_id'])) {
            $order = Order::where('status', Order::STATUS_WAIT_REFUND)->find($data['order_id']);

            if ($order) {
                $params = ['order' => $order];
                Event::trigger(EventName::ORDER_REFUND, $params);
            }
        }

        return true;
    }
}