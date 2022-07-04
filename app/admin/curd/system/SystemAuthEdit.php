<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Edit;

class SystemAuthEdit extends Edit
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
        'get_module_enum' => ['name' => '模块', 'key' => 'module'],
    ];
}