<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\user;

use app\water_company\curd\Change;

class UserChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'is_vip', 'sex',];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}