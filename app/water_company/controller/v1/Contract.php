<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\water_company\controller\v1;

use app\validate\PaginateValidate;
use app\validate\TimeTypeValidate;
use app\water_company\controller\BaseController;
use app\logic\ContractLogic;

class Contract extends BaseController
{
    protected $name = '合同';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new ContractLogic();
    }

    public function history($page = 1, $limit = 0, $type = 'day')
    {
        TimeTypeValidate::batchCheck(['type' => $type]);
        PaginateValidate::batchCheck();

        $where       = [];
        $limit       = $this->getHistoryLimit($limit, $type);
        $countMethod = 'countBy' . ucfirst($type);
        $moneyMethod = 'sumBy' . ucfirst($type);
        $flowMethod  = 'sumBy' . ucfirst($type);
        $args        = ['page' => $page, 'num' => $limit];
        $count       = $this->logic->$countMethod($where, $args);
        $money       = $this->logic->$moneyMethod('amount', $where, $args);
        $flow        = $this->logic->$flowMethod('flow', $where, $args);

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
