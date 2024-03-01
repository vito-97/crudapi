<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_config;

use app\admin\crud\Delete;

class SystemConfigDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
