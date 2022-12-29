<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 15:05
 */

namespace app\service\user;


use app\exception\AccountDisabledException;
use app\exception\NotLoginException;
use app\logic\AdminLogic;
use app\service\TokenService;

class AdminService extends BaseUserService
{
    protected $type = TokenService::ADMIN;

    /**
     * 获取管理员用户
     * @return \app\model\BaseModel|array|false|mixed|\think\Model|null
     * @throws AccountDisabledException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function userinfo()
    {
        if ($this->isLogin()) {
            $logic = new AdminLogic();

            $user = $logic->getByID($this->uid());

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
