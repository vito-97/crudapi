<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\withdrawal;

use app\common\curd\Change;

class WithdrawalChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'mark', 'refuse_mark'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}