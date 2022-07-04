<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Delete;

class DeviceAppVersionDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}