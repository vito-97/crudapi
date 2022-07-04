<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\user;

use app\agent\curd\Save;
use app\common\Enum;
use app\model\User;
use app\validate\UserValidate;

class UserSave extends Save
{
    //验证器
    protected $validate = [
        UserValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['username' => '', 'platform' => User::ADD_PLATFORM];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform'];
    protected $withoutField = true;

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip']   = $this->request->ip();
        $params['agent_id'] = $this->user->uid();

        return $next($params);
    }
}