<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\contract;

use app\common\Enum;
use app\validate\ContractValidate;
use app\water_company\curd\Update;

class ContractUpdate extends Update
{
    //验证器
    protected $validate = [
        ContractValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['is_recharge','water_company_id'];
    protected $withoutField = true;
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}