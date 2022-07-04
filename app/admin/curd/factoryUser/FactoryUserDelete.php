<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\factoryUser;

use app\common\curd\Delete;

class FactoryUserDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}