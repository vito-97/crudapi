<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\contract;

use app\common\Enum;
use app\validate\ContractValidate;
use app\water_company\curd\Save;

class ContractSave extends Save
{
    //验证器
    protected $validate = [
        ContractValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['is_recharge'];
    protected $withoutField = true;

    protected $withUser = 'water_company_id';

    protected function saveMiddleware($next, $params)
    {
        $response = $next($params);

        if ($response) {
            //给取水客户充值上
            $response->customer->flow = ['inc', $response->flow];
            $status                   = $response->customer->save();
            //标记成已充值状态
            if ($status) {
                $response->is_recharge = 1;
                $response->save();
            }

        }

        return $response;
    }
}