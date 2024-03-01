<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 16:14
 */

namespace app\admin\crud\admin;


use app\admin\crud\Read;

class AdminRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
}
