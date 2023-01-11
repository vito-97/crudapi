<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts;

use app\admin\curd\Delete;

class PostsDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
