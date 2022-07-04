<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\cashCoupon;

use app\agent\curd\Delete;

class CashCouponCardDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}