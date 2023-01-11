<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\category;

use app\admin\curd\Update;

class CategoryUpdate extends Update
{
    //验证器
    protected $validate = [];
    //允许新增的数据字段
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
