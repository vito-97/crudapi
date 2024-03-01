<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_role;

use app\admin\crud\Delete;
use app\exception\MessageException;
use think\Model;

class SystemRoleDelete extends Delete
{
    use SystemRoleTrait;

    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        $this->disabledModifySuperAdmin($model);

        if (!$this->hasRoleToDo($model)) {
            throw new MessageException('无权限删除该角色');
        }

        $this->canDelete($model);

        return $next($model);
    }
}
