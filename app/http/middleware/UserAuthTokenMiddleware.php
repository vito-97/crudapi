<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 15:25
 */

namespace app\http\middleware;


use app\exception\AccessTokenEmptyException;
use app\exception\NotLoginException;
use app\service\AuthRouteService;
use app\service\TokenService;
use app\service\user\UserService;
use think\facade\Config;
use think\Request;

class UserAuthTokenMiddleware
{
    /**
     * 不需要登录排除的路由
     * @var string[]
     */
    protected $exclude = [
        'api/Login/login',
    ];

    //用户登录状态
    public function handle(Request $request, \Closure $next, $type = TokenService::USER, $force = true)
    {
        $route = get_route();

        $service      = new AuthRouteService();
        $class        = $service->getReflectionClassByRoute($route);
        $notNeedLogin = $class->getConstant('NOT_NEED_LOGIN');
        $action       = $request->action();

        //不需要登录的方法
        if (in_array('*', $notNeedLogin) || in_array($action, $notNeedLogin)) {
            $request->setUser(new UserService([], '', $type));
            return $next($request);
        }

        if (!in_array($route, $this->exclude)) {
            $token = trim($request->header(Config::get('web.auth_token_key')));

            //分割類型
            if (strpos($token, '_')) {
                [$customType, $token] = explode('_', $token);

                if (empty($type)) {
                    $type = $customType;
                }
            }

            if (empty($token) || empty($type)) {
                if ($force) {
                    throw new AccessTokenEmptyException();
                } else {
                    $request->setUser(new UserService([], '', $type ?: TokenService::USER));
                    return $next($request);
                }
            }

            $tokenService = new TokenService($type);
            $user         = $tokenService->get($token);

            if (!$user) {
                throw new NotLoginException();
            }
            $request->setUser(new UserService($user, $token, $type));

        } else {
            $request->setUser(new UserService([], '', $type));
        }

        return $next($request);
    }
}
