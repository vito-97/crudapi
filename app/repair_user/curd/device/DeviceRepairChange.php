<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Change;

class DeviceRepairChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}