<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\couponUser;

use app\waterworks\curd\Change;

class CouponUserChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sex',];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}