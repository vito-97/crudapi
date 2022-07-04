<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Edit;

class DeviceEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = ['adverts_light_desc', 'status_desc'];
    protected $hidden = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}