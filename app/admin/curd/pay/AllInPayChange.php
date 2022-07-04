<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\pay;

use app\common\curd\Change;

class AllInPayChange extends Change
{
    //允许修改的字段
    protected $field = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}