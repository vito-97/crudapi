<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Enum;
use app\common\Message;

class SystemRoleValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'     => 'require|max:30|unique:system_role',
        'key'      => 'require|max:15|unique:system_role',
        'mark'     => 'max:120',
        'auth_ids' => 'require|checkIds',
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
        Enum::VALID_SAVE_SCENE   => 'all',
        Enum::VALID_UPDATE_SCENE => 'all',
    ];
}