<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\device;

use app\water_company\curd\Change;

class DeviceChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'used_global_product', 'adverts_light'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}