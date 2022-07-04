<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Delete;

class DeviceRepairDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}