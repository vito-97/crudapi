<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\waterworks;

use app\common\Enum;
use app\model\User;
use app\validate\WaterworksValidate;
use app\water_company\curd\Save;

class WaterworksSave extends Save
{
    //验证器
    protected $validate = [
        WaterworksValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['username' => '', 'platform' => User::ADD_PLATFORM];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform', 'money', 'flow', 'user_id'];
    protected $withoutField = true;
    protected $withUser = 'user_id';

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip'] = $this->request->ip();
        $params['type']   = User::WATERWORKS_TYPE;

        return $next($params);
    }
}