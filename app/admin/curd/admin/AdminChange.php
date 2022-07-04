<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 16:13
 */

namespace app\admin\curd\admin;


use app\common\curd\Change;

class AdminChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [1];
    //条件
    protected $where = [];
}