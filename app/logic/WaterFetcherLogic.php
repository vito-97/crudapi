<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\common\ErrorCode;
use app\common\EventName;
use app\common\Hash;
use app\exception\MessageException;
use app\exception\PasswordErrorException;
use app\exception\UserNotFoundException;
use app\model\User;
use app\model\UserOauth;
use app\model\WaterFetcher;
use app\service\TokenService;
use think\facade\Event;

class WaterFetcherLogic extends UserLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return WaterFetcher::class;
    }

    /**
     * 绑定取水员
     * @param $username
     * @param $password
     * @return User
     * @throws MessageException
     * @throws PasswordErrorException
     * @throws UserNotFoundException
     * @throws \Psr\SimpleCache\InvalidArgumentException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function bindUser($username, $password)
    {
        /**
         * @var $user User
         */
        $user = $this->getByUsername($username);

        if (!$user) {
            throw new UserNotFoundException();
        }

        //验证密码
        $valid = Hash::validatePassword($password, $user->password);

        if (!$valid) {
            throw new PasswordErrorException(ErrorCode::USER_PASSWORD_ERROR);
        }

        $uid = $this->user->uid();

        if ($user->id == $uid) {
            throw new MessageException(ErrorCode::WATER_FETCHER_IS_BIND);
        }

        $oauthLogic = new UserOauthLogic();

        $has = $oauthLogic->where('user_id', $user->id)->where('type', UserOauth::TYPE_WECHAT)->field('id')->find();

        if ($has) {
            throw new MessageException(ErrorCode::WATER_FETCHER_IS_OTHER_BIND);
        }

        $oauth = $oauthLogic->where('user_id', $uid)->where('type', UserOauth::TYPE_WECHAT)->find();

        if (!$oauth) {
            throw new MessageException('未授权微信账号信息');
        }

        $oauth->user_id = $user->id;
        $status         = $oauth->save();

        if ($status) {
            $this->user->logout();
            //触发登录事件
            Event::trigger(EventName::USER_LOGIN, ['user' => $user, 'type' => TokenService::USER]);
            return $user;
        } else {
            throw new MessageException('绑定取水员失败');
        }
    }
}
