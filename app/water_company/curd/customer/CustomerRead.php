<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\customer;

use app\water_company\curd\Read;

class CustomerRead extends Read
{
    //需要展示的字段
    protected $field = ['money', 'flow', 'used_flow', 'invitation_code', 'spread_count', 'is_vip', 'pay_count'];
    //排除字段
    protected $withoutField = true;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = [];
}