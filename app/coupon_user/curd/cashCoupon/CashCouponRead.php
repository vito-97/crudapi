<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\cashCoupon;

use app\coupon_user\curd\Read;

class CashCouponRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    protected $hidden = ['full_minus', 'type', 'delete_time'];
    //条件
    protected $where = [];
    //关联
    protected $with = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}