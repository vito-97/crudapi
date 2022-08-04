<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

class UserValidate extends BaseValidate
{
    const LOGIN_SCENE = 'login';
    const REGISTER_SCENE = 'register';

    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'username'     => 'require|alphaDash|length:4,20|unique:user',
        'nickname'     => 'require|length:2,20|unique:user',
        'password'     => 'requireWithout:id|checkPassword|length:8,20',
        'tel'          => 'mobile|unique:user',
        'phone'        => 'alphaDash|max:15',
        'real_name'    => 'chsDash|max:20',
        'sex'          => 'checkEnum',
        'birthday'     => 'date',
        'id_card'      => 'idCard',
        'avatar'       => 'isUrl',
        'status'       => 'require|checkEnum',
        'is_vip'       => 'checkSwitch',
        'email'        => 'email',
        'mark'         => 'max:120',
        'money'        => 'float',
        'agent_id'     => 'checkHasCanEmpty:agent',
//        'invitation_code'  => 'unique:user',
        'type'         => 'checkEnum',
        'product_type' => 'checkEnum',
        'flow'         => 'isPositiveInteger:zero',
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
        self::SAVE_SCENE     => 'all',
        self::UPDATE_SCENE   => 'all',
        self::LIST_SCENE     => ['sex', 'status', 'agent_id', 'type'],
        self::LOGIN_SCENE    => ['username', 'password'],
        self::REGISTER_SCENE => ['username', 'nickname', 'tel', 'avatar', 'password'],
    ];

    /**
     * 登录场景
     * @return UserValidate
     */
    protected function sceneLogin()
    {
        return $this->only($this->scene[self::LOGIN_SCENE])->remove('username', 'unique');
    }
}
