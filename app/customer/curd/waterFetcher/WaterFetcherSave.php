<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\common\Enum;
use app\customer\curd\Save;
use app\model\User;
use app\validate\WaterFetcherValidate;

class WaterFetcherSave extends Save
{
    //验证器
    protected $validate = [
        WaterFetcherValidate::class => Enum::VALID_SAVE_SCENE,
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
        $params['type']     = User::WATER_FETCHER_TYPE;

        return $next($params);
    }
}