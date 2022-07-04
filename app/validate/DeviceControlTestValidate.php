<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\validate;

class DeviceControlTestValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'imei'          => 'require|alphaNum|max:50',
        'num|num_value' => 'require|isPositiveInteger',
        'status'        => 'require|checkSwitch',
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
        'imei'   => ['imei'],
        'num'    => ['imei', 'num'],
        'status' => ['imei', 'status'],
    ];
}