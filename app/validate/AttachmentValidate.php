<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\validate;

class AttachmentValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'     => 'require|max:100',
        'category' => 'require|checkEnum',
        'url'      => 'require|isUrl|max:255',
        'width'    => 'number',
        'height'   => 'number',
        'type'     => 'require|max:20',
        'size'     => 'require|number',
        'mime'     => 'require|max:50',
        'storage'  => 'require|checkEnum',
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
        self::SAVE_SCENE   => ['category'],
        self::UPDATE_SCENE => 'all',
    ];
}