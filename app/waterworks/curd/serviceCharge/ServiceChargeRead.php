<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\serviceCharge;

use app\waterworks\curd\Read;

class ServiceChargeRead extends Read
{
    //需要展示的字段
    protected $field = ['agent_id'];
    //排除字段
    protected $withoutField = true;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = ['device','trade'];
}