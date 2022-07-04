<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Message;

class UserRebateValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'order_id' => 'require|checkHasCanEmpty:order',
        'user_id' => 'require|checkHasCanEmpty:user',
        'type' => 'require|checkEnum',
        'status' => 'require|checkEnum',
        'pm' => 'require|checkEnum',
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
        self::LIST_SCENE => ['order_id', 'user_id', 'type', 'status', 'pm'],
    ];
}