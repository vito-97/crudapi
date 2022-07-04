<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\product;

use app\water_company\curd\Save;
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
    protected $field = ['name', 'allow_refund', 'price', 'give_money', 'device_id', 'status', 'mark', 'is_vip', 'flow', 'give_flow'];

    protected $withUser = 'agent_id';
}