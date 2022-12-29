<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/6
 * Time: 15:44
 */

namespace app\service\user;

use app\exception\AccountDisabledException;
use app\exception\NotLoginException;
use app\model\User;
use app\service\TokenService;

class UserService extends BaseUserService
{
    const TYPE = [
        User::NORMAL_TYPE => 'user',
    ];

    // 类型对应的模型
    const TYPE_MODEL = [
        TokenService::USER    => 'member',
    ];

    protected function userinfo()
    {
        if ($this->isLogin()) {
            $name  = self::TYPE_MODEL[$this->type] ?? $this->type;
            $model = model($name);

            $user = $model->getByID($this->uid());

            if (!$user) {
                throw new NotLoginException();
            }

            if ($user->isDisabled()) {
                //删除登录信息
                $this->logout();

                throw new AccountDisabledException();
            }

            return $user;
        }

        return false;
    }

    /**
     * 登出
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function logout($all = false)
    {
        //删除token信息
        $tokenService = new TokenService($this->type);

        if ($all) {
            $tokenService->removeLoginToken($this->uid());
            return true;
        } else {
            return $tokenService->delete($this->token);
        }
    }
}
