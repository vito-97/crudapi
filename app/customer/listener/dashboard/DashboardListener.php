<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\customer\listener\dashboard;

use app\common\ArrayObject;
use app\logic\FlowLogic;
use app\logic\WaterFetcherLogic;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $uid               = Request::getUser()->uid();
        $waterFetcherLogic = new WaterFetcherLogic();
        $flowLogic         = new FlowLogic();

        $params->merge([
            'count_water_fetcher_user' => $waterFetcherLogic->count(),

            'total_used_flow'       => $waterFetcherLogic->sumTotal('used_flow'),
            'total_flow'            => $waterFetcherLogic->sumTotal('flow'),
            'total_today_used_flow' => $flowLogic->sumTotal('flow', [], 1, 'day'),
            'total_month_used_flow' => $flowLogic->sumTotal('flow', [], 1, 'month'),
            'total_year_used_flow'  => $flowLogic->sumTotal('flow', [], 1, 'year'),

            'today_used_flow_list' => $flowLogic->sumByDay('flow', [], ['num' => 15]),
        ]);
    }
}