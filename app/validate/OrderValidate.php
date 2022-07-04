<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Enum;

class OrderValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'title'          => 'max:100',
        'user_id'        => 'require|checkHas:user',
        'agent_id'       => 'checkHas:agent',
        'status'         => 'require|checkEnum',
        'product_id'     => 'require|checkHas:product',
        'coupon_card_id' => 'checkHasCanEmpty:coupon_card',
        'price'          => 'require|float',
        'mark'           => 'max:120',
        'device_id'      => 'require|checkHas:device',
        'order_no'       => 'require|checkHas:order,order_no',
        'channel_type'   => 'require|checkEnum',
    ];

    /**
     * 字段对应的名称
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name => valid_field.name 或 name => name_alias
     * @var array
     */
    protected $field = [

    ];

    /**
     * 验证消息
     * 可设置语言包字段 无分组
     * @var array
     */
    protected $message = [

    ];

    /**
     * 验证场景
     * @var array
     */
    protected $scene = [
        self::SAVE_SCENE   => ['title', 'agent', 'user_id', 'status', 'product_id', 'coupon_card_id', 'device_id', 'mark'],
        self::UPDATE_SCENE => ['title', 'status', 'mark'],
        self::CREATE_SCENE => ['product_id', 'coupon_card_id', 'device_id'],
        self::DETAIL_SCENE => ['order_no'],
        self::LIST_SCENE   => ['user_id', 'status', 'product_id', 'channel_type', 'device_id'],
    ];
}