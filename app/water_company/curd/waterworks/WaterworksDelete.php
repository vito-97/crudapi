<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\waterworks;

use app\water_company\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class WaterworksDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}