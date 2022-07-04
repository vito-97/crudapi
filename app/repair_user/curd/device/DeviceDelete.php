<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Delete;

class DeviceDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}