<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 15:25
 */

namespace app\admin\middleware;


use app\exception\AccessTokenEmptyException;
use app\exception\NotLoginException;
use app\service\AuthRouteService;
use app\service\TokenService;
use app\service\user\AdminService;
use think\facade\Config;
use think\Request;

class AdminAuthTokenMiddleware
{
    /**
     * 不需要登录排除的路由
     * @var string[]
     */
    protected $exclude = [
        'admin/Login/login',
    ];

    //管理员登录状态
    public function handle(Request $request, \Closure $next)
    {
        $route = get_route();

        $service      = new AuthRouteService();
        $class        = $service->getReflectionClassByRoute($route);
        $notNeedLogin = $class->getConstant('NOT_NEED_LOGIN');
        $action       = $request->action();

        //不需要登录的方法
        if (in_array('*', $notNeedLogin) || in_array($action, $notNeedLogin)) {
            $request->setUser(new AdminService([], ''));
            return $next($request);
        }

        if (!in_array($route, $this->exclude)) {
            $token = trim($request->header(Config::get('web.auth_token_key')));

            if (empty($token)) {
                throw new AccessTokenEmptyException();
            }

            $tokenService = new TokenService(TokenService::ADMIN);
            $admin        = $tokenService->get($token);

            if (!$admin) {
                throw new NotLoginException();
            }

            $request->setUser(new AdminService($admin, $token));

        } else {
            $request->setUser(new AdminService([], ''));
        }

        return $next($request);
    }
}