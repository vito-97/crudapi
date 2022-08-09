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
use app\logic\UserLogic;
use app\model\User;
use app\service\TokenService;

class UserService extends BaseUserService
{
    const TYPE = [
        User::NORMAL_TYPE        => 'user',
        User::WATER_COMPANY_TYPE => 'water_company',
        User::WATERWORKS_TYPE    => 'waterworks',
        User::CUSTOMER_TYPE      => 'customer',
        User::WATER_FETCHER_TYPE => 'water_fetcher',
        User::AGENT_TYPE         => 'agent',
        User::REPAIR_TYPE        => 'repair_user',
        User::COUPON_TYPE        => 'coupon_user',
        User::FACTORY_TYPE       => 'factory_user',
    ];

    // 类型对应的模型
    const TYPE_MODEL = [
        self::TYPE[User::NORMAL_TYPE] => 'member',
    ];

    protected function userinfo()
    {
        if ($this->isLogin()) {
            $name  = self::TYPE_MODEL[$this->type] ?? $this->type;
            $model = model($name);

            $user  = $model->getByID($this->uid());

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
    public function logout()
    {
        //删除token信息
        $tokenService = new TokenService($this->type);
        return $tokenService->delete($this->token);
    }
}
