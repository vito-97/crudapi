<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class SystemRoleDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->isSuper()) {
            throw new DataCannotBeDeletedException('超级管理员权限不可删除');
        }

        return $next($model);
    }
}