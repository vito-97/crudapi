<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\Message;

class AdminValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'username'      => 'require|alphaDash|length:4,20|unique:admin',
        'nickname'      => 'require|chsDash|length:2,20|unique:admin',
        'password'      => 'requireWithout:id|checkPassword|length:8,20',
        'role_id'       => 'require|isPositiveInteger|checkHas:system_role',
        'tel'           => 'mobile',
        'email'         => 'email',
        'mark'          => 'max:100',
        'disabled_mark' => 'max:255',
        'captcha'       => 'require|captcha',
        'status'        => 'require|checkEnum',
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
        'password.checkPassword' => Message::PASSWORD_RULE_FAIL,
        'role_id.checkRole'      => Message::ROLE_NOT_FOUND,
    ];

    /**
     * 验证场景
     * @var array
     */
    protected $scene = [
        'login'            => ['username', 'password'/*, 'captcha'*/],
        self::SAVE_SCENE   => ['username', 'password', 'nickname', 'role_id', 'tel', 'email', 'mark', 'disabled_mark'],
        self::UPDATE_SCENE => ['password', 'nickname', 'role_id', 'tel', 'email', 'mark', 'disabled_mark'],
        self::LIST_SCENE   => ['role_id', 'status'],
        'profile'          => ['nickname', 'password', 'avatar', 'tel', 'email'],
    ];

    /**
     * 登录场景
     * @return AdminValidate
     */
    public function sceneLogin()
    {
        return $this->only($this->getSceneOnly(__FUNCTION__))->remove('username', 'unique');
    }

    protected function sceneProfile()
    {
        $this->only($this->getSceneOnly(__FUNCTION__));
        $this->removeOnlyRule([], 'require|requireWithout');

        return $this;
    }
}