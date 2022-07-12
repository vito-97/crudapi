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
        if (!$request->isOptions()) {
            $route              = get_route();
            $service            = new AuthRouteService();
            $name               = $service->getMethodNameByRoute($route);
            $request->routeName = $name;

            $this->record($request);
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
            $user = $request->getUser();
            $data = [
                'title'   => $request->routeName,
                'module'  => app()->http->getName(),
                'route'   => get_route(),
                'url'     => $request->baseUrl(),
                'query'   => http_build_query($request->get()),
                'method'  => $request->method(),
                'ip'      => $request->ip(),
                'ua'      => $request->server('http_user_agent'),
                'user_id' => $user ? $user->uid() : 0,
                'site_id' => $user ? $user->getUserInfo()->role->site_id : 0,
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