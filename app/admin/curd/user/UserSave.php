<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user;

use app\common\curd\Save;
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
    protected $field = [];

    protected function saveMiddleware($next, $params)
    {
        if (empty($params['site_id'])) {
            $params['site_id'] = $this->getUserRole()->site_id;
        }
        $params['add_ip'] = $this->request->ip();

        return $next($params);
    }
}