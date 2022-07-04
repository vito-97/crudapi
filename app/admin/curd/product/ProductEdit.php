<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\product;

use app\common\curd\Edit;

class ProductEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['agent'];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_is_vip_switch' => ['name' => '会员套餐'],
        'get_allow_refund_switch' => ['name' => '是否可退'],
    ];
}