<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\serviceCharge;

use app\common\curd\Save;
use app\common\Enum;
use app\validate\ServiceChargeValidate;

class ServiceChargeSave extends Save
{
    //验证器
    protected $validate = [
        ServiceChargeValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];
}