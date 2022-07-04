<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 9:18
 */

namespace app\admin\listener;


use app\exception\AccountDisabledException;
use app\exception\AdminNotFoundException;
use app\exception\CreateTokenErrorException;
use app\service\TokenService;
use think\Request;

class AdminLoginListener
{
    //有效时间
    protected $exp;

    public function __construct()
    {
        $this->exp = 86400 * 31;
    }

    /**
     * 登录事件处理
     * @param Request $request
     * @param array $params
     * @return mixed
     * @throws AdminNotFoundException
     */
    public function handle(Request $request, $params = [])
    {
        $user = $params['user'] ?? null;

        if (!$user) {
            throw new AdminNotFoundException();
        }

        //判断是否为禁用的
        if ($user->isDisabled()) {
            throw new AccountDisabledException();
        }

        //获取jwt
        //不使用jwt 使用token + redis
//        $playload = [
//            'uid' => $user->id,
//            'username' => $user->username,
//            'nickname' => $user->nickname,
//            'role_id' => $user->role_id,
//            'exp' => $this->exp,
//        ];
//
//        $jwt = JwtAuthService::encode($playload);
//        $user->jwt = $jwt;

        $playload = [
            'id' => $user->id,
        ];

        $tokenService = new TokenService(TokenService::ADMIN);
        $token        = $tokenService->set($playload, $this->exp);

        if (!$token) {
            throw new CreateTokenErrorException();
        }

        $time                  = time();
        $ip                    = $request->ip();
        $user->last_login_ip   = $ip;
        $user->last_login_time = $time;
        $user->save();

        $user->token = $token;

        //允许展示的字段
        //['id', 'username', 'nickname', 'last_login_ip', 'last_login_time', 'role_id', 'create_time', 'token']
        $user->visible(['token', 'username', 'nickname', 'role_id', 'last_login_ip', 'last_login_time',]);

        return $user;
    }
}