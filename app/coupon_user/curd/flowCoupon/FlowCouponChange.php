<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\flowCoupon;

use app\common\curd\Change;

class FlowCouponChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sort', 'limit', 'limit_type'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
