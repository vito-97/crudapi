<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\serviceCharge;

use app\common\curd\Change;

class ServiceChargeChange extends Change
{
    //允许修改的字段
    protected $field = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}