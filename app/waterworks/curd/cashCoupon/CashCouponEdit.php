<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\cashCoupon;

use app\waterworks\curd\Edit;

class CashCouponEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['coupon_user'];
    //追加字段
    protected $append = [];
    protected $hidden = ['full_minus', 'type', 'delete_time'];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_limit_type_enum' => ['name' => '限制领取类型', 'key' => 'limit_type'],
    ];
}