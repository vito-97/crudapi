<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\flow;

use app\common\curd\Read;

class FlowRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = ['device', 'user'];
}