<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\waterFetcher;

use app\common\curd\Delete;

class WaterFetcherDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}