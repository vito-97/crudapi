<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class UserRebateDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->is_on) {
            throw new DataCannotBeDeletedException('有效的记录不可删除');
        }

        return $next($model);
    }
}