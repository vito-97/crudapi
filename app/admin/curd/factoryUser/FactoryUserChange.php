<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\factoryUser;

use app\common\curd\Change;

class FactoryUserChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sex'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}