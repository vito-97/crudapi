<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 16:13
 */

namespace app\admin\crud\admin;


use app\admin\crud\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class AdminDelete extends Delete
{
    use AdminTrait;

    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($this->isSuperAdmin($model)) {
            throw new DataCannotBeDeletedException('不可删除超级管理员');
        }

        return $next($model);
    }
}
