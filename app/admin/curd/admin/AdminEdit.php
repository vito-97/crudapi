<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 16:14
 */

namespace app\admin\curd\admin;


use app\common\curd\Edit;

class AdminEdit extends Edit
{
    use AdminCurdTrait;

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
    //追加标签
    protected $labelCallback = [
        'get_role_label' => ['name' => '角色', 'field' => 'role_id', 'key' => 'role'],
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}