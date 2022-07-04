<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\repairUser;

use app\agent\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class RepairUserDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}