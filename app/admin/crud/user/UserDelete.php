<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\user;

use app\admin\crud\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class UserDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->money > 0) {
            throw new DataCannotBeDeletedException('用户有余额，不可删除');
        }

        return $next($model);
    }
}
