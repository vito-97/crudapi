<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\customer;

use app\common\curd\Save;
use app\common\Enum;
use app\model\User;
use app\validate\CustomerValidate;

class CustomerSave extends Save
{
    //验证器
    protected $validate = [
        CustomerValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [
        'type' => User::CUSTOMER_TYPE,
    ];
    //允许新增的数据字段
    protected $field = [];

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip'] = $this->request->ip();

        return $next($params);
    }
}