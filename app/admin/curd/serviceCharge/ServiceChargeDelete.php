<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\serviceCharge;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class ServiceChargeDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->is_pay) {
            throw new DataCannotBeDeletedException('不可删除已支付的数据');
        }

        return $next($model);
    }
}