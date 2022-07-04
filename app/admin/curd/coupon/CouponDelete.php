<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\coupon;

use app\common\curd\Delete;
use app\exception\MessageException;
use think\Model;

class CouponDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [
        //有领取的话则不能删除
//        'issued_total' => 0,
    ];
    protected $together = ['couponCard'];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->issued_total > 0 && !$this->request->param('force')) {
            throw new MessageException('已被领取，不可删除');
        }

        return $next($model);
    }
}