<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\flowCoupon;

use app\common\curd\Delete;

class FlowCouponCardDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
