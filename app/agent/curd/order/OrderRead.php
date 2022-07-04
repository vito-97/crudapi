<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\order;

use app\agent\curd\Read;

class OrderRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = ['status_desc', 'channel_type_desc'];
    //条件
    protected $where = [];
    //关联
    protected $with = ['user', 'device', 'coupon_card'];
}