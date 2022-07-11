<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

class SystemConfigValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'                 => 'require|max:50',
        'key'                  => 'require|alphaDash|max:50|unique:system_config',
        'type'                 => 'require|alphaDash|max:20',
        'system_config_tab_id' => 'require|checkHas:system_config_tab',
        'opts'                 => 'max:255',//规则
        'validate'             => 'max:100',
        'value'                => 'max:9999',
        'placeholder'          => 'max:255',
        'sort'                 => 'number|between:0,255',
        'status'               => 'require|checkSwitch',
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
        self::LIST_SCENE   => ['status', 'type', 'system_config_tab_id'],
    ];
}