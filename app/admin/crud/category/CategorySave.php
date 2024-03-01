<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\category;

use app\admin\crud\Save;

class CategorySave extends Save
{
    //验证器
    protected $validate = [];
    //追加数据
    protected $appendParams = ['type' => 0];
    //允许新增的数据字段
    protected $field = [];
}
