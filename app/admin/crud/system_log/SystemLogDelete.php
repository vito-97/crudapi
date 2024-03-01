<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_log;

use app\admin\crud\Delete;

class SystemLogDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
