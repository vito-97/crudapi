<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\customer\curd\Delete;
use app\exception\DataCannotBeDeletedException;
use think\Model;

class WaterFetcherDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}