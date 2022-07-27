<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Enum;
use app\common\Message;

class ProductValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'device_no'         => 'max:10',
        'name'              => 'max:50',
        'allow_refund'      => 'checkSwitch',
        'flow'              => 'requireIf:type,1|isPositiveInteger:zero',
        'give_flow'         => 'isPositiveInteger:zero',
        'device_id'         => 'checkHasCanEmpty:device',
        'status'            => 'require|checkEnum',
        'price'             => 'require|float',
        'money'             => 'float',
        'mark'              => 'max:120',
        'is_vip'            => 'require|checkSwitch',
        'agent_id'          => 'checkHasCanEmpty:agent',
        'type|product_type' => 'checkEnum',
        'second'            => 'requireIf:type,2|isPositiveInteger:zero',
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
        self::LIST_SCENE   => ['allow_refund', 'device_id', 'status', 'is_vip', 'agent_id'],
        self::SAVE_SCENE   => 'all',
        self::UPDATE_SCENE => 'all',
        'api_index'        => ['device_no'],
    ];
}
