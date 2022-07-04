<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\cashCoupon;

use app\common\curd\Change;

class CashCouponChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sort'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}