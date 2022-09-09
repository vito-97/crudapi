<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system_log;

use app\common\curd\Delete;

class SystemLogDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
