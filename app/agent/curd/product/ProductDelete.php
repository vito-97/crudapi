<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\product;

use app\agent\curd\Delete;

class ProductDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}