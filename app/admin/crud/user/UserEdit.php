<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\user;

use app\admin\crud\Edit;

class UserEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_platform_enum' => ['name' => '类型'],
        'get_sex_enum' => ['name' => '性别'],
        'get_type_enum' => ['name' => '用户类型'],
    ];
}
