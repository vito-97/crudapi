<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 11:23
 */

namespace app\http\middleware;

use app\common\Enum;
use app\job\SystemLogJob;
use app\logic\SystemLogLogic;
use app\service\AuthRouteService;
use think\facade\Queue;
use think\Request;

class SystemLogMiddleware
{
    public function handle(Request $request, \Closure $next)
    {
        $response = $next($request);

        //后置中间件记录访问
        if (!$request->isOptions() && $request->controller() && $request->action()) {
            $router = get_route();

            $service       = new AuthRouteService();
            $class         = $service->getReflectionClassByRoute($router);
            $notNeedLogger = $class->getConstant('NOT_NEED_LOGGER');
            $action        = $request->action();

            //需要记录日志
            if (empty($notNeedLogger) || (!in_array('*', $notNeedLogger) && !in_array($action, $notNeedLogger))) {
                //获取路由规则
                $rule  = $request->rule();
                $route = $rule->getRoute();
                //没规则是未定义路由
                $name               = $route ? $service->getMethodNameByRoute($router) : 404;
                $request->routeName = $name;

                $this->record($request);
            }

        }

        return $response;
    }

    /**
     * 记录访问日志
     * @param Request $request
     */
    public function record(Request $request)
    {
        if ($request->routeName) {
            $user  = $request->getUser();
            $is404 = 404 === $request->routeName;
            $data  = [
                'title'   => $is404 ? '未定义的路由地址' : $request->routeName,
                'module'  => app()->http->getName(),
                'route'   => $is404 ? '' : get_route(),
                'url'     => $request->baseUrl(),
                'query'   => http_build_query($request->get()),
                'method'  => $request->method(),
                'ip'      => $request->ip(),
                'ua'      => $request->server('http_user_agent'),
                'user_id' => $user ? $user->uid() : 0,
            ];

            if (config('web.system_log_queue')) {
                Queue::push(SystemLogJob::class, $data, Enum::JOB_SYSTEM_LOG);
            } else {
                $logic = new SystemLogLogic();
                $logic->add($data);
            }

        }
    }
}
