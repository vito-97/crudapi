<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Save;
use app\common\Enum;
use app\exception\DataInoperableException;
use app\validate\SystemRoleValidate;

class SystemRoleSave extends Save
{
    //验证器
    protected $validate = [
        SystemRoleValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['name', 'key', 'mark', 'auth_ids'];

    protected function saveMiddleware($next, $params)
    {
        $role = $this->user->getUserInfo()->role;

        if (!$role->isSuper()) {
            $ids    = $role->auth_ids_array;
            $authId = $params['auth_ids'];
            if (is_string($authId)) {
                $authId = explode(',', $authId);
            }

            //取交集
            $allowId = array_intersect($authId, $ids);

            $params['auth_ids'] = $allowId;
            $params['admin_id'] = $this->user->uid();
        }

        return $next($params);
    }
}