<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\order;

use app\common\curd\Edit;

class OrderEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [
        'user', 'device', 'coupon_card', 'agent', 'product',
    ];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum'       => ['name' => '状态'],
        'get_channel_type_enum' => ['name' => '支付类型'],
        'get_type_enum'         => ['name' => '订单类型'],
    ];
}