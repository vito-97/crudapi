<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\flowCoupon;

use app\common\curd\Delete;
use app\exception\MessageException;
use think\Model;

class FlowCouponDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $together = ['couponCard'];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->issued_total > 0 && !$this->request->param('force')) {
            throw new MessageException('已被领取，不可删除');
        }

        return $next($model);
    }
}
