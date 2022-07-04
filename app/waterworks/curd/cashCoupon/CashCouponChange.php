<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\cashCoupon;

use app\waterworks\curd\Change;

class CashCouponChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sort'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}