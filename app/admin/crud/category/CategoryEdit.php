<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\category;

use app\admin\crud\Edit;

class CategoryEdit extends Edit
{
    use CategoryCrudTrait;

    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['children'];

    protected $withCount = [];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'    => ['name' => '状态', 'key' => 'status'],
        'get_is_show_switch' => ['name' => '展示', 'key' => 'is_show'],
        'get_top_label'      => ['name' => '父类', 'field' => 'pid', 'key' => 'top'],
    ];
}
