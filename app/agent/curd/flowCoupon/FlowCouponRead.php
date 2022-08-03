<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\flowCoupon;

use app\common\curd\Read;

class FlowCouponRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = ['coupon_user'];

    protected $hidden = ['full_minus', 'type', 'delete_time'];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}
