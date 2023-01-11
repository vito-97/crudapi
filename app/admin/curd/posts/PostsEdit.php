<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts;

use app\admin\curd\Edit;

class PostsEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['category'];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'   => ['name' => '状态', 'key' => 'status'],
        'get_is_top_switch' => ['name' => '置顶', 'key' => 'is_top'],
    ];
}
