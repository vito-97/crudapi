<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts_category;

use app\admin\curd\category\CategoryEdit;

class PostsCategoryEdit extends CategoryEdit
{
    protected $labelCallback = [
        'get_status_enum'    => ['name' => '状态', 'key' => 'status'],
        'get_is_show_switch' => ['name' => '展示', 'key' => 'is_show'],
        'get_top_label'      => ['name' => '父类', 'field' => 'pid', 'key' => 'top'],
        'get_single_switch'  => ['name' => '单文章', 'key' => 'single'],
    ];
}
