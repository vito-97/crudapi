<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Delete;

class DeviceDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $together = ['tip', 'device_control', 'repair','service_charge_list'];
}