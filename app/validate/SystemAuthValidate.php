<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Enum;

class SystemAuthValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'    => 'require|max:50',
        'route'   => 'require|unique:system_auth',
        'url'     => 'isUrl|max:100',
        'status'  => 'require|checkEnum',
        'module'  => 'require',
        'is_menu' => 'require|checkSwitch',
        'icon'    => 'max:50',
        'pid'     => 'checkHasCanEmpty:system_auth',
        'sort'    => 'isPositiveInteger:zero|max:255',
        'mark'    => 'max:100',
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
        Enum::VALID_SAVE_SCENE   => ['name', 'route', 'url', 'status', 'module', 'is_menu', 'icon', 'pid', 'sort', 'mark'],
        Enum::VALID_UPDATE_SCENE => ['name', 'route', 'url', 'status', 'module', 'is_menu', 'icon', 'pid', 'sort', 'mark'],
    ];
}