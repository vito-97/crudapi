<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\cashCoupon;

use app\agent\curd\Change;

class CashCouponCardChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}