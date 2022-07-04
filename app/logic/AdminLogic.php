<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:32
 */

namespace app\logic;

use app\common\ErrorCode;
use app\common\EventName;
use app\exception\AdminNotFoundException;
use app\exception\PasswordErrorException;
use app\common\Hash;
use app\model\Admin;
use app\model\User;
use app\service\JwtAuthService;
use app\exception\AccountDisabledException;
use think\facade\Event;
use think\facade\Request;

class AdminLogic extends BaseLogic
{
    protected function getModelName()
    {
        return Admin::class;
    }

    /**
     * 登录
     * @param $username
     * @param $password
     * @return mixed
     * @throws AdminNotFoundException
     * @throws PasswordErrorException
     */
    public function login($username, $password)
    {
        /**
         * @var $user User
         */
        $user = $this->getByUsername($username);

        if (!$user) {
            throw new AdminNotFoundException();
        }

        //验证密码
        $valid = Hash::validatePassword($password, $user->password);

        if (!$valid) {
            throw new PasswordErrorException(ErrorCode::ADMIN_PASSWORD_ERROR);
        }

        //触发登录事件
        Event::trigger(EventName::ADMIN_LOGIN, ['user' => $user]);

        return $user;
    }

    /**
     * 登出
     * @return mixed
     */
    public function logout()
    {
        $user = $this->request->user;

        $status = $user->logout();

        if ($status) {
            Event::trigger(EventName::ADMIN_LOGOUT, ['user' => $user]);
        }

        return $status;
    }
}