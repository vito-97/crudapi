<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\product;

use app\agent\curd\Update;
use app\common\Enum;
use app\validate\ProductValidate;

class ProductUpdate extends Update
{
    //验证器
    protected $validate = [
        ProductValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['name', 'allow_refund', 'price', 'give_money', 'device_id', 'status', 'mark', 'is_vip', 'flow', 'give_flow', 'type', 'second'];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
