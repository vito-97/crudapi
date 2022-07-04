<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Message;

class CouponCardValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'coupon_id' => 'require|isPositiveInteger|checkHas:coupon',
        'user_id' => 'require|isPositiveInteger|checkHas:user',
        'status' => 'require|checkEnum',
        'is_use' => 'require|checkSwitch',
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
        self::SAVE_SCENE => ['coupon_id', 'user_id', 'status'],
        self::UPDATE_SCENE => ['coupon_id', 'user_id', 'status'],
        self::LIST_SCENE => 'all',
    ];
}