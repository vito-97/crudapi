<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\order;

use app\waterworks\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use app\model\Order;
use think\Model;

class OrderDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->is_pay) {
            throw new DataCannotBeDeletedException('订单已支付，不可删除');
        }

        if ($model->is_wait_refund) {
            throw new DataCannotBeDeletedException('订单正在申请退款，不可删除');
        }

        if ($model->is_refund) {
            throw new DataCannotBeDeletedException('订单已退款，不可删除');
        }

        return $next($model);
    }
}