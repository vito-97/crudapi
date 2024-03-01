<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts;

use app\admin\crud\Change;

class PostsChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'is_top'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
