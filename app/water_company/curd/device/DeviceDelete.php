<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\device;

use app\water_company\curd\Delete;

class DeviceDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $together = ['tip', 'device_control', 'repair','service_charge_list'];
}