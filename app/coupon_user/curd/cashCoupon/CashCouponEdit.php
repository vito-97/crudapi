<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\cashCoupon;

use app\coupon_user\curd\Edit;

class CashCouponEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_limit_type_enum' => ['name' => '限制领取类型', 'key' => 'limit_type'],
    ];

    protected $hidden = ['full_minus', 'type', 'delete_time'];
}