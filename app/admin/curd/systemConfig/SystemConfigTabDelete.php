<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Delete;

class SystemConfigTabDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $together = [
        'child',
    ];
}