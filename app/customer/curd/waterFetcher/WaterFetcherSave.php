<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\customer\curd\Save;
use app\common\Enum;
use app\model\User;
use app\validate\RepairUserValidate;

class WaterFetcherSave extends Save
{
    //验证器
    protected $validate = [
        RepairUserValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['username' => '', 'platform' => User::ADD_PLATFORM];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform', 'money', 'flow'];
    protected $withoutField = true;
    protected $withUser = true;

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip']   = $this->request->ip();
        $params['type']     = User::REPAIR_TYPE;

        return $next($params);
    }
}