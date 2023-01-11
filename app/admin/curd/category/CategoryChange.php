<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\category;

use app\admin\curd\Change;

class CategoryChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'is_show', 'sort'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
