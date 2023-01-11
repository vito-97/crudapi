<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system_role;

use app\admin\curd\Change;
use app\exception\MessageException;
use think\Model;

class SystemRoleChange extends Change
{
    use SystemRoleTrait;

    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        $this->disabledModifySuperAdmin($model);

        if (!$this->hasRoleToDo($model)) {
            throw new MessageException('没有权限修改角色');
        }

        return parent::saveMiddleware($next, $model, $params);
    }
}
