<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\customer\listener\dashboard;

use app\common\ArrayObject;
use app\logic\DeviceLogic;
use app\logic\DeviceRepairLogic;
use app\logic\FlowLogic;
use app\logic\OrderLogic;
use app\logic\RepairUserLogic;
use app\logic\ServiceChargeLogic;
use app\model\Device;
use app\model\DeviceRepair;
use app\model\ServiceCharge;
use think\facade\Db;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $uid           = Request::getUser()->uid();
        $repairUser    = new RepairUserLogic();
        $deviceLogic   = new DeviceLogic();
        $flowLogic     = new FlowLogic();
        $orderLogic    = new OrderLogic();
        $deviceRepair  = new DeviceRepairLogic();
        $serviceCharge = new ServiceChargeLogic();

        $orderWhere = array_merge($orderLogic->statisticsWhere(),
            [
                ['agent_id', '=', $uid],
            ]
        );

        //获取设备ID
        $devices = $deviceLogic->where('agent_id', $uid)->field('id')->buildSql();

        $where = [
            ['id', 'EXP', Db::raw('IN' . $devices)],
        ];

        $params->merge([
            'count_device'        => $deviceLogic->count(),
            'count_repair_user'   => $repairUser->count(),
            'count_online_device' => $deviceLogic->where('status', Device::STATUS_ON)->count(),
            'count_fault_device'  => $deviceLogic->where('status', Device::STATUS_FAULT)->count(),

            'total_used_flow'              => $deviceLogic->sumTotal('used_flow', $where),
            'total_today_used_flow'        => $flowLogic->sumTotal('flow', $where, 1, 'day'),
            'total_month_used_flow'        => $flowLogic->sumTotal('flow', $where, 1, 'month'),
            'total_year_used_flow'         => $flowLogic->sumTotal('flow', $where, 1, 'year'),
            'total_money'                  => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere),
            'total_today_money'            => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'day'),
            'total_month_money'            => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'month'),
            'total_year_money'             => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'year'),
            'today_used_flow_list'         => $flowLogic->sumByDay('flow', $where, ['num' => 15]),
            'today_money_list'             => $orderLogic->sumByDay('`pay_price` - `refund_money`', $orderWhere, ['num' => 15]),
            //待处理的的报障信息
            'device_wait_repair_list'      => $deviceRepair->getAll(['where' => ['agent_id' => $uid, 'status' => DeviceRepair::WAIT_STATUS], 'limit' => 15, 'with' => 'device']),
            //待支付的服务费
            'service_charge_wait_pay_list' => $serviceCharge->getAll(['where' => ['agent_id' => $uid, 'is_pay' => ServiceCharge::SWITCH_OFF], 'limit' => 15, 'with' => 'device']),
        ]);
    }
}