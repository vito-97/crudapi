<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\validate;

class DeviceRepairValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'title'          => 'require|max:100',
        'content'        => 'require',
        'device_id'      => 'require|isPositiveInteger|checkHas:device',
        'status'         => 'require|checkEnum',
        'user_id'        => 'checkHasCanEmpty:user',
        'repair_user_id' => 'checkHasCanEmpty:repair_user',
        'mark'           => 'max:120',
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
    ];
}