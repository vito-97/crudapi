<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\pay;

use app\water_company\curd\Save;

class AllInPaySave extends Save
{
    //验证器
    protected $validate = [];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];
}