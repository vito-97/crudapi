<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\adverts;

use app\agent\curd\Delete;

class AdvertsDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}