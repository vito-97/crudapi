<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\customer;

use app\water_company\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class CustomerDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}