<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 15:25
 */

namespace app\admin\middleware;


use app\common\EventName;
use app\exception\NotAuthException;
use app\logic\SystemRoleLogic;
use app\service\AuthRouteService;
use app\service\user\AdminService;
use think\facade\Event;
use think\Request;
use think\trace\TraceDebug;

class AdminCheckAuthMiddleware
{
    /**
     * 排除的权限
     * @var string[]
     */
    protected $exclude = [
        'admin/Login/login',
        'admin/Login/logout',
    ];

    /**
     * 授权检测
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     * @throws NotAuthException
     * @throws \app\exception\DataNotFoundException
     */
    public function handle(Request $request, \Closure $next)
    {
        //获取到最新的用户信息
        $userService = $request->getUser();
        $admin       = $userService->getUserInfo();
        $role_id     = $userService->role_id();
        $route       = get_route();

        $service     = new AuthRouteService();
        $class       = $service->getReflectionClassByRoute($route);
        $notNeedAuth = $class->getConstant('NOT_NEED_AUTH');
        $action      = $request->action();


        //不需要验证权限的方法
        if (in_array('*', $notNeedAuth) || in_array($action, $notNeedAuth)) {
            return $next($request);
        }

        if (!in_array($route, $this->exclude)) {
            //检测权限
            $logic  = new SystemRoleLogic();
            $status = $logic->check($role_id, get_route_without_version(true));
            //没有权限
            if (!$status) {
                //触发事件
                Event::trigger(EventName::NOT_AUTH_VISIT, ['user' => $request->getUser(), 'route' => $route]);

                throw new NotAuthException();
            }
        }

        return $next($request);
    }
}