<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts;

use app\admin\crud\Delete;

class PostsDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
