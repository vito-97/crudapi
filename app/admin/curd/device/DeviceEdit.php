<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Edit;

class DeviceEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['agent', 'tip'];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum'       => ['name' => '状态', 'key' => 'status'],
        'get_product_type_enum' => ['name' => '套餐类型'],
        'get_type_enum'         => ['name' => '类型', 'key' => 'type'],
    ];
}
