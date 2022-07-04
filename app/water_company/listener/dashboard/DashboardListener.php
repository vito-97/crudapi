<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\water_company\listener\dashboard;

use app\common\ArrayObject;
use app\logic\CouponUserLogic;
use app\logic\DeviceLogic;
use app\logic\FlowLogic;
use app\logic\OrderLogic;
use app\logic\RepairUserLogic;
use app\logic\UserLogic;
use app\logic\WaterworksLogic;
use app\model\Device;
use app\model\Waterworks as WaterworksModel;
use think\facade\Db;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $deviceLogic     = new DeviceLogic();
        $flowLogic       = new FlowLogic();
        $waterworksLogic = new WaterworksLogic();
        $orderLogic      = new OrderLogic();

        $orderWhere = array_merge($orderLogic->statisticsWhere(),
            [
                ['agent_id', 'exp', Db::raw('IN' . WaterworksModel::field('id')->buildSql())],
            ]
        );

        //获取当前水务的所有水厂ID
        $waterworksUser = $waterworksLogic->field('id')->buildSql();
        //获取水厂的所有设备ID
        $devices = $deviceLogic->where('agent_id', 'EXP', 'IN' . $waterworksUser)->field('id')->buildSql();

        $where = [
            ['id', 'EXP', Db::raw('IN' . $devices)],
        ];

        $params->merge([
            'total_used_flow'       => $deviceLogic->sumTotal('used_flow', $where),
            'total_today_used_flow' => $flowLogic->sumTotal('flow', $where, 1, 'day'),
            'total_month_used_flow' => $flowLogic->sumTotal('flow', $where, 1, 'month'),
            'total_year_used_flow'  => $flowLogic->sumTotal('flow', $where, 1, 'year'),
            'total_money'           => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere),
            'total_today_money'     => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'day'),
            'total_month_money'     => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'month'),
            'total_year_money'      => $orderLogic->sumTotal('`pay_price` - `refund_money`', $orderWhere, 1, 'year'),
            'today_used_flow_list'  => $flowLogic->sumByDay('flow', $where, ['num' => 15]),
            'today_money_list'      => $orderLogic->sumByDay('`pay_price` - `refund_money`', $orderWhere, ['num' => 15]),
        ]);
    }
}