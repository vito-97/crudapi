<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\withdrawal;

use app\common\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class WithdrawalDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->is_progress) {
            throw new DataCannotBeDeletedException('当前提现中，不可删除');
        }

        if ($model->is_resolve) {
            throw new DataCannotBeDeletedException('当前已提现，不可删除');
        }

        return $next($model);
    }
}