<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\customer;

use app\common\curd\Delete;

class CustomerDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}