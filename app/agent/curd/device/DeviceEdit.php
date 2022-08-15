<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\device;

use app\agent\curd\Edit;

class DeviceEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['service_charge'];
    //追加字段
    protected $append = ['adverts_light_desc', 'status_desc'];
    protected $hidden = ['service_charge' => ['agent_id', 'device_id', 'delete_time']];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_product_type_enum' => ['name' => '套餐类型'],
    ];
}
