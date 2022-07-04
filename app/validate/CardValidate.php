<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Message;

class CardValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'card_no' => 'require|unique:card|max:20',
        'status' => 'require|checkEnum',
        'agent_id' => 'require|isPositiveInteger|checkHas:agent',
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
        self::SAVE_SCENE => ['card_no', 'status'],
        self::UPDATE_SCENE => ['card_no', 'status'],
        self::LIST_SCENE => ['status', 'agent_id'],
    ];
}