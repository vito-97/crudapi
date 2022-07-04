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
use app\common\Hash;
use app\exception\AdminNotFoundException;
use app\exception\PasswordErrorException;
use app\exception\RegisterErrorException;
use app\exception\TouristUserLoginErrorException;
use app\exception\UserNotFoundException;
use app\model\User;
use app\service\TokenService;
use app\validate\UserValidate;
use think\facade\Event;
use think\facade\Request;
use think\helper\Str;

class UserLogic extends BaseLogic
{
    protected function getModelName()
    {
        return User::class;
    }

    /**
     * 游客登录
     * @param string $username
     * @param string $type
     * @return \app\model\BaseModel|mixed
     * @throws TouristUserLoginErrorException
     */
    public function touristLogin($username = '', $type = TokenService::USER)
    {
        $random = Str::random(10);

        if (empty($username)) {
            $username = 'tourist_' . $random;
        }

        $user = $this->getModel()->add([
            'username' => $username,
            'password' => Str::random(10),
            'nickname' => '游客' . $random,
            'platform' => User::H5_PLATFORM,
            'add_ip'   => Request::ip(),
            'flow'     => config('web.is_dev') ? 100 : 0,
        ]);

        if (!$user) {
            throw new TouristUserLoginErrorException();
        }

        if ($user)
            Event::trigger(EventName::USER_LOGIN, ['user' => $user, 'type' => $type]);

        return $user;
    }

    /**
     * 注册
     * @param array $params
     * @param string $type
     * @return \app\model\BaseModel
     * @throws RegisterErrorException
     * @throws \app\exception\ValidateException
     */
    public function register($params = [], $type = User::NORMAL_TYPE)
    {
        $params['type'] = $type;
        UserValidate::batchCheck($params, UserValidate::REGISTER_SCENE);

        $user = $this->getModel()->add($params);

        if (!$user) {
            throw new RegisterErrorException();
        }

        return $user;
    }

    /**
     * 登录
     * @param $username
     * @param $password
     * @return mixed
     * @throws UserNotFoundException
     * @throws PasswordErrorException
     */
    public function login($username, $password, $type = TokenService::USER)
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

        //触发登录事件
        Event::trigger(EventName::USER_LOGIN, ['user' => $user, 'type' => $type]);

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
            Event::trigger(EventName::USER_LOGOUT, ['user' => $user]);
        }

        return $status;
    }
}