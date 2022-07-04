<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Edit;

class DeviceAppVersionEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = null;
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_is_new_switch' => ['name' => '最新', 'key' => 'is_new'],
        'get_is_force_switch' => ['name' => '强制更新', 'key' => 'is_force'],
    ];
}