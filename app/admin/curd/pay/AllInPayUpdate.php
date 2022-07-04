<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\pay;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\AllInPayValidate;

class AllInPayUpdate extends Update
{
    //验证器
    protected $validate = [
        AllInPayValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //数据字段
    protected $field = ['price','refund_price','agent_id'];
    //排除字段
    protected $withoutField = true;
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}