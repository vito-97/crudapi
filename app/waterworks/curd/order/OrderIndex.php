<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\order;

use app\waterworks\curd\Index;
use app\common\Enum;
use app\model\Order;
use app\validate\OrderValidate;

class OrderIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [
        ['type', '=', Order::RECHARGE_TYPE],
    ];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $queryField = ['user_id', 'product_id', 'status', 'device_id', 'channel_type', 'type'];

    protected $append = ['status_desc', 'channel_type_desc'];

    protected $validate = [
        OrderValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $with = [
        'user', 'device', 'coupon_card',
    ];

    protected $labelCallback = [
        'get_status_enum'       => ['name' => '状态'],
        'get_channel_type_enum' => ['name' => '支付类型'],
        'get_type_enum'         => ['name' => '订单类型'],
    ];
}
