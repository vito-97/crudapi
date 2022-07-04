<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\validate;

class CustomerValidate extends UserValidate
{
    /**
     * 验证场景
     * @var array
     */
    protected $scene = [
        self::SAVE_SCENE   => 'all',
        self::UPDATE_SCENE => 'all',
        self::LIST_SCENE   => ['sex', 'status', 'type'],
        self::LOGIN_SCENE  => ['username', 'password'],
        'profile'          => ['password', 'nickname', 'avatar'],
    ];

    protected function sceneProfile()
    {
        $this->only($this->getSceneOnly(__FUNCTION__));
        $this->removeOnlyRule([], 'require|requireWithout');

        return $this;
    }
}