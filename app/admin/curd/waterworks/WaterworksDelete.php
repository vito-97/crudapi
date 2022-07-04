<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\waterworks;

use app\common\curd\Delete;

class WaterworksDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}