<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\waterCompany;

use app\common\curd\Save;
use app\common\Enum;
use app\model\User;
use app\validate\WaterCompanyValidate;

class WaterCompanySave extends Save
{
    //验证器
    protected $validate = [
        WaterCompanyValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [
        'type' => User::AGENT_TYPE,
    ];
    //允许新增的数据字段
    protected $field = [];

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip'] = $this->request->ip();

        return $next($params);
    }
}