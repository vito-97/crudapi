<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\agent\listener\dashboard;

use app\common\ArrayObject;
use app\logic\CouponUserLogic;
use app\logic\DeviceLogic;
use app\logic\OrderLogic;
use app\logic\RepairUserLogic;
use app\logic\UserLogic;
use app\model\Device;
use app\model\Order;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $user       = new UserLogic();
        $repairUser = new RepairUserLogic();
        $couponUser = new CouponUserLogic();
        $device     = new DeviceLogic();
        $order      = new OrderLogic();

        $params->merge([
            'count_user'                 => $user->count(),
            'count_device'               => $device->count(),
            'count_repair_user'          => $repairUser->count(),
            'count_coupon_user'          => $couponUser->count(),
            'count_online_device'        => $device->where('status', Device::STATUS_ON)->count(),
            'count_fault_device'         => $device->where('status', Device::STATUS_FAULT)->count(),
            'count_order'                => $order->countOrder(),
            'count_order_today'          => $order->countOrder(1),
            'count_order_week'           => $order->countOrder(1, 'week'),
            'count_order_month'          => $order->countOrder(1, 'month'),
            'count_order_year'           => $order->countOrder(1, 'year'),
            'sum_order_money'            => $order->sumMoney(),
            'sum_order_money_today'      => $order->sumMoney(1),
            'sum_order_money_week'       => $order->sumMoney(1, 'week'),
            'sum_order_money_month'      => $order->sumMoney(1, 'month'),
            'sum_order_money_year'       => $order->sumMoney(1, 'year'),
            'count_order_week_list'      => $order->countOrderListByDay(),
            'count_order_month_list'     => $order->countOrderListByMonth(),
            'sum_order_money_week_list'  => $order->sumMoneyListByDay(),
            'sum_order_money_month_list' => $order->sumMoneyListByMonth(),
//            'order_list'          => $order->getAll(['order' => ['id' => 'desc']]),
        ]);
    }
}