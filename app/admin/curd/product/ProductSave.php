<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\product;

use app\common\curd\Save;
use app\common\Enum;
use app\validate\ProductValidate;

class ProductSave extends Save
{
    //验证器
    protected $validate = [
        ProductValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['name' => ''];
    //允许新增的数据字段
    protected $field = ['name', 'allow_refund', 'price', 'agent_id', 'give_money', 'device_id', 'status', 'mark'];
}