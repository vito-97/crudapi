<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use app\exception\MessageException;
use think\Model;

class SystemRoleDelete extends Delete
{
    use CheckSystemRoleTrait;

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

        return $next($model);
    }
}