<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts_category;

use app\admin\curd\category\CategoryIndex;

class PostsCategoryIndex extends CategoryIndex
{
    protected $withCount = ['posts'];

    protected $labelCallback = [
        'get_status_enum'    => ['name' => '状态', 'key' => 'status'],
        'get_is_show_switch' => ['name' => '展示', 'key' => 'is_show'],
        'get_single_switch'  => ['name' => '单文章', 'key' => 'single'],
    ];
}
