<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_config;

use app\admin\crud\Change;

class SystemConfigChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'name', 'sort'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
