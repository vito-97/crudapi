<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\product;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\ProductValidate;

class ProductUpdate extends Update
{
    //验证器
    protected $validate = [
        ProductValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['name', 'allow_refund', 'price', 'give_money', 'device_id', 'status', 'mark', 'agent_id'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}