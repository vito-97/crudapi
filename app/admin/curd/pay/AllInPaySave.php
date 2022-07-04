<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\pay;

use app\common\curd\Save;
use app\validate\AllInPayValidate;

class AllInPaySave extends Save
{
    //验证器
    protected $validate = [
        AllInPayValidate::class => 'save'
    ];
    //追加数据
    protected $appendParams = [];
    //数据字段
    protected $field = ['price','refund_price'];
    //排除字段
    protected $withoutField = true;
}