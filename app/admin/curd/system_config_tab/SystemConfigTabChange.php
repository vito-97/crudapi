<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system_config_tab;

use app\common\curd\Change;

class SystemConfigTabChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
