<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\couponUser;

use app\agent\curd\Save;
use app\common\Enum;
use app\model\User;
use app\validate\CouponUserValidate;

class CouponUserSave extends Save
{
    //验证器
    protected $validate = [
        CouponUserValidate::class => Enum::VALID_SAVE_SCENE,
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