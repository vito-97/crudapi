<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\product;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class ProductDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->buy_total) {
            throw new DataCannotBeDeletedException('套餐有被购买过，不可删除');
        }

        return $next($model);
    }
}