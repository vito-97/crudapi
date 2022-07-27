<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/29
 * Time: 16:03
 */

namespace app\customer\controller\v1;

use app\customer\controller\BaseController;
use app\logic\FlowLogic;
use app\logic\WaterFetcherLogic;
use app\validate\CustomerUsedFlowStatisticsValidate;
use app\validate\PaginateValidate;
use app\validate\TimeTypeValidate;
use think\helper\Str;

class Flow extends BaseController
{
    protected $name = '取水记录';

    protected $registerCurd = ['index', 'read'];

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new FlowLogic();
    }

    public function history($page = 1, $limit = 0, $type = 'day')
    {
        TimeTypeValidate::batchCheck(['type' => $type]);
        PaginateValidate::batchCheck();

        $limit = $this->getHistoryLimit($limit, $type);

        $sumMethod = 'sumBy' . ucfirst($type);
        $args      = ['page' => $page, 'num' => $limit, 'fetch_sql' => false];

        $flow = $this->logic->$sumMethod('flow', [], $args);

        $result         = $flow;
        $result['list'] = [];

        foreach ($flow['list'] as $key => $item) {
            $result['list'][] = [
                'time'  => $key,
                'flow'  => $item,
            ];
        }

        return $this->success($result);
    }

    public function used($page = 1, $limit = 15, $type = 'water_fetcher')
    {
        CustomerUsedFlowStatisticsValidate::batchCheck('flow');
        PaginateValidate::batchCheck();

        $method = 'used' . Str::studly($type);

        if (method_exists($this, $method)) {
            $result = $this->$method($page, $limit);
        } else {
            $result = [];
        }

        return $this->success($result);
    }

    protected function usedWaterFetcher($page, $limit)
    {
        $logic = new WaterFetcherLogic();

        $args = [
            'field'    => ['id', 'nickname', 'username', 'flow', 'used_flow'],
            'order'    => [
                'used_flow' => 'desc',
            ],
            'page'     => $page,
            'limit'    => $limit,
            'paginate' => true,
        ];

        return $logic->getAll($args)->append([]);
    }
}
