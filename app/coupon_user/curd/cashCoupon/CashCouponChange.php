<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\cashCoupon;

use app\coupon_user\curd\Change;

class CashCouponChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sort', 'limit', 'limit_type'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}