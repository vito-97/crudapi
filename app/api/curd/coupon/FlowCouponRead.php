<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\api\curd\coupon;

use app\common\curd\Read;

class FlowCouponRead extends Read
{
    //需要展示的字段
    protected $field = [
        'id', 'name', 'amount', 'create_time', 'limit', 'limit_type', 'status', 'total', 'is_infinite', 'issued_total', 'get_end_time', 'get_start_time', 'use_end_time', 'use_start_time',
    ];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = [];
}
