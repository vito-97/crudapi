<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/29
 * Time: 16:03
 */

namespace app\waterworks\controller\v1;

use app\logic\CustomerLogic;
use app\logic\DeviceLogic;
use app\logic\FlowLogic;
use app\logic\OrderLogic;
use app\validate\PaginateValidate;
use app\validate\TimeTypeValidate;
use app\validate\UsedFlowStatisticsValidate;
use app\water_company\controller\BaseController;
use think\facade\Db;
use think\helper\Str;

class Flow extends BaseController
{
    protected $name = '取水记录';

    protected function initialize()
    {
        $this->logic = new FlowLogic();
    }

    public function history($page = 1, $limit = 0, $type = 'day')
    {
        TimeTypeValidate::batchCheck(['type' => $type]);
        PaginateValidate::batchCheck();

        $limit      = $this->getHistoryLimit($limit, $type);
        $orderLogic = new OrderLogic();

        //获取水厂的所有设备ID
        $devices = $this->getDeviceIdSql();

        $where = [
            ['device_id', 'EXP', Db::raw('IN' . $devices)],
        ];

        $orderWhere = array_merge($orderLogic->statisticsWhere(),
            [
                ['agent_id', '=', $this->uid()],
            ]
        );

        $sumMethod = 'sumBy' . ucfirst($type);
        $args      = ['page' => $page, 'num' => $limit, 'fetch_sql' => false];

        $flow  = $this->logic->$sumMethod('flow', $where, $args);
        $money = $orderLogic->$sumMethod('`pay_price` - `refund_money`', $orderWhere, $args);

        $result         = $flow;
        $result['list'] = [];

        foreach ($flow['list'] as $key => $item) {
            $result['list'][] = [
                'time'  => $key,
                'flow'  => $item,
                'money' => $money['list'][$key],
            ];
        }

        return $this->success($result);
    }

    public function used($page = 1, $limit = 15, $type = 'device')
    {
        UsedFlowStatisticsValidate::batchCheck('flow');
        PaginateValidate::batchCheck();

        $method = 'used' . Str::studly($type);

        if (method_exists($this, $method)) {
            $result = $this->$method($page, $limit);
        } else {
            $result = [];
        }

        return $this->success($result);
    }

    protected function usedDevice($page, $limit)
    {
        $logic = new DeviceLogic();

        $args = [
            'field'    => ['id', 'name', 'device_no', 'imei', 'used_flow'],
            'where'    => [
                ['id', 'Exp', Db::raw('IN' . $this->getDeviceIdSql())],
            ],
            'order'    => [
                'used_flow' => 'desc',
            ],
            'page'     => $page,
            'limit'    => $limit,
            'paginate' => true,
        ];

        return $logic->getAll($args)->append([]);
    }

    protected function _usedCustomer($page, $limit)
    {
        $logic = new CustomerLogic();

        $args = [
            'field'    => ['id', 'nickname', 'username', 'used_flow'],
            'where'    => [
                ['user_id', '=', $this->getUserinfo()->user_id],
            ],
            'order'    => [
                'used_flow' => 'desc',
            ],
            'page'     => $page,
            'limit'    => $limit,
            'paginate' => true,
        ];

        return $logic->getAll($args)->append([]);
    }

    protected function getDeviceIdSql()
    {
        $deviceLogic = new DeviceLogic();

        //获取水厂的所有设备ID
        $devices = $deviceLogic->where('agent_id', $this->uid())->field('id')->buildSql();

        return $devices;
    }
}