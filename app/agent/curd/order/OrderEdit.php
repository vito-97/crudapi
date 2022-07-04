<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\order;

use app\agent\curd\Edit;
use app\model\Order;

class OrderEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = ['status_desc', 'channel_type_desc'];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_channel_type_enum' => ['name' => '支付类型'],
        'get_type_enum' => ['name' => '订单类型'],
    ];
}