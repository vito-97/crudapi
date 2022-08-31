<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

class CouponValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'           => 'max:50',
        'full_minus'     => 'require|float',
        'amount'         => 'require|float',
        'total'          => 'requireIf:is_infinite,0|isPositiveInteger:zero',
        'is_infinite'    => 'require|checkEnum',
        'product_id'     => 'require|checkHas:product',
        'get_start_time' => 'date',
        'get_end_time'   => 'date',
        'use_start_time' => 'date',
        'use_end_time'   => 'date',
        'get_time'       => 'array',
        'use_time'       => 'array',
        'coupon_day'     => 'require|number',
        'sort'           => 'isPositiveInteger:zero',
        'status'         => 'require|checkEnum',
        'limit'          => 'require|isPositiveInteger:zero',
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
        self::SAVE_SCENE   => 'all',
        self::UPDATE_SCENE => 'all',
        self::LIST_SCENE   => ['product_id', 'coupon_user_id', 'is_infinite', 'agent_id'],
    ];
}
