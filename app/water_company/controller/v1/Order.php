<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/28
 * Time: 16:28
 */

namespace app\water_company\controller\v1;

use app\logic\OrderLogic;
use app\validate\PaginateValidate;
use app\validate\TimeTypeValidate;
use app\water_company\controller\BaseController;
use think\facade\Db;
use \app\model\Waterworks as WaterworksModel;

class Order extends BaseController
{
    protected $name = '订单';

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new OrderLogic();
    }

    public function history($page = 1, $limit = 0, $type = 'day')
    {
        TimeTypeValidate::batchCheck(['type' => $type]);
        PaginateValidate::batchCheck();

        $limit = $this->getHistoryLimit($limit, $type);
        $where = array_merge($this->logic->statisticsWhere(),
            [
                ['agent_id', 'exp', Db::raw('IN' . WaterworksModel::field('id')->where('user_id', $this->uid())->buildSql())],
            ]
        );

        $countMethod = 'countBy' . ucfirst($type);
        $sumMethod   = 'sumBy' . ucfirst($type);
        $args        = ['page' => $page, 'num' => $limit, 'fetch_sql' => false];

        $count = $this->logic->$countMethod($where, $args);
        $money = $this->logic->$sumMethod('`pay_price` - `refund_money`', $where, $args);
        $flow  = $this->logic->$sumMethod('flow', $where, $args);

        $result = $count;

        foreach ($result['list'] as $key => $item) {
            $result['list'][$key] = [
                'count' => $item,
                'money' => $money['list'][$key],
                'flow'  => $flow['list'][$key],
            ];
        }

        return $this->success($result);
    }

}