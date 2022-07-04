<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\factory_user\curd\device;

use app\factory_user\curd\Delete;

class DeviceDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}