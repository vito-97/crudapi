<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\product;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\ProductValidate;

class ProductIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    protected $with = ['agent'];
    //排除字段
    protected $withoutField = false;

    protected $queryField = [
        'device_id', 'agent_id', 'status', 'is_vip', 'allow_refund',
    ];

    protected $validate = [
        ProductValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_is_vip_switch' => ['name' => '会员套餐'],
        'get_allow_refund_switch' => ['name' => '是否可退'],
    ];
}