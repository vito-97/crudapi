<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:26
 */

namespace app\listener;


use app\exception\CreateTokenErrorException;
use app\exception\UserNotFoundException;
use app\service\TokenService;
use think\Request;

class UserLoginListener
{
    //有效时间
    protected $exp;

    public function __construct()
    {
        $this->exp = 86400 * 365;
    }

    /**
     * 登录事件处理
     * @param Request $request
     * @param array $params
     * @return mixed
     * @throws UserNotFoundException
     */
    public function handle(Request $request, $params = [])
    {
        $user = $params['user'] ?? null;
        $type = $params['type'] ?? TokenService::USER;

        if (!$user) {
            throw new UserNotFoundException();
        }

        $playload = [
            'id' => $user->id,
        ];

        $tokenService = new TokenService($type);
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
        $user->visible(['token', 'username', 'nickname', 'role_id', 'last_login_ip', 'last_login_time',]);

        return $user;
    }
}