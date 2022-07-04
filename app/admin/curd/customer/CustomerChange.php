<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\customer;

use app\common\curd\Change;

class CustomerChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'sex'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}