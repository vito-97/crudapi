<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\admin\listener\dashboard;

use app\common\ArrayObject;
use app\common\Enum;
use app\logic\CustomerLogic;
use app\logic\DeviceLogic;
use app\logic\FlowLogic;
use app\logic\OrderLogic;
use app\logic\UserLogic;
use app\logic\WaterCompanyLogic;
use app\logic\WaterFetcherLogic;
use app\logic\WaterworksLogic;
use app\model\Device;
use app\model\Order;
use app\model\User;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $user = Request::getUser()->getUserInfo();

        if ($user->site_id === Enum::SITE_ONE) {
            $this->one($params);
        } elseif ($user->site_id === Enum::SITE_TWO) {
            $this->two($params);
        }
    }

    protected function one($params)
    {
        $user   = new UserLogic();
        $device = new DeviceLogic();
        $order  = new OrderLogic();

        $params->merge([
            'count_user'                 => $user->count(),
            'count_agent'                => $user->where('type', User::AGENT_TYPE)->count(),
            'count_device'               => $device->count(),
            'count_online_device'        => $device->where('status', Device::STATUS_ON)->count(),
            'count_fault_device'         => $device->where('status', Device::STATUS_FAULT)->count(),
            'count_order'                => $order->countOrder(),
            'count_order_week'           => $order->countOrder(1, 'week'),
            'count_order_month'          => $order->countOrder(1, 'month'),
            'count_order_year'           => $order->countOrder(1, 'year'),
            'sum_order_money'            => $order->sumMoney(),
            'sum_order_money_week'       => $order->sumMoney(1, 'week'),
            'sum_order_money_month'      => $order->sumMoney(1, 'month'),
            'sum_order_money_year'       => $order->sumMoney(1, 'year'),
            'count_order_week_list'      => $order->countOrderListByDay(),
            'count_order_month_list'     => $order->countOrderListByMonth(),
            'sum_order_money_week_list'  => $order->sumMoneyListByDay(),
            'sum_order_money_month_list' => $order->sumMoneyListByMonth(),
            'order_list'                 => $order->getAll(['order' => ['id' => 'desc'], 'where' => ['type' => Order::RECHARGE_TYPE]]),
        ]);
    }

    protected function two($params)
    {
        $waterCompany = new WaterCompanyLogic();
        $waterworks   = new WaterworksLogic();
        $customer     = new CustomerLogic();
        $waterFetcher = new WaterFetcherLogic();
        $device       = new DeviceLogic();
        $flow         = new FlowLogic();
        $order        = new OrderLogic();

        $args = [
            'field' => ['id', 'nickname', 'username', 'used_flow'],

            'where' => [],
            'order' => [
                'used_flow' => 'desc',
            ],
            'limit' => 20,
        ];

        //已全局设置 不需要单独设置
//        $where = [['site_id', '=', Enum::SITE_TWO]];
        $where = [];
        $params->merge([
            'count_water_company'   => $waterCompany->count(),
            'count_waterworks'      => $waterworks->count(),
            'count_customer'        => $customer->count(),
            'count_water_fetcher'   => $waterFetcher->count(),
            'count_device'          => $waterFetcher->where($where)->count(),
            'count_online_device'   => $device->where('status', Device::STATUS_ON)->where($where)->count(),
            'count_fault_device'    => $device->where('status', Device::STATUS_FAULT)->where($where)->count(),
            'count_order'           => $order->countOrder(),
            'total_used_flow'       => $device->sumTotal('used_flow', $where),
            'total_today_used_flow' => $flow->sumTotal('flow', $where, 1, 'day'),
            'total_month_used_flow' => $flow->sumTotal('flow', $where, 1, 'month'),
            'total_year_used_flow'  => $flow->sumTotal('flow', $where, 1, 'year'),

            'count_order_week_list'      => $order->countOrderListByDay(),
            'count_order_month_list'     => $order->countOrderListByMonth(),
            'sum_order_money_week_list'  => $order->sumMoneyListByDay(),
            'sum_order_money_month_list' => $order->sumMoneyListByMonth(),

            'sum_order_money' => $order->sumMoney(),

            'water_company_used_flow_list' => $waterCompany->getAll($args)->append([]),
            'customer_used_flow_list'      => $customer->getAll($args)->append([]),
            'waterworks_used_flow_list'    => $waterworks->getAll($args)->append([]),
            'water_fetcher_used_flow_list' => $waterFetcher->getAll($args)->append([]),
        ]);
    }
}