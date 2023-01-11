<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:33
 */

namespace app\logic;

use app\model\SystemAuth;
use app\service\AuthRouteService;
use think\helper\Str;

class SystemAuthLogic extends BaseLogic
{
    protected function getModelName()
    {
        return SystemAuth::class;
    }

    /**
     * 刷新权限
     * @return \think\Collection
     * @throws \ReflectionException
     * @throws \app\exception\ErrorException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function flush()
    {
        //获取所有路由
        $service = new AuthRouteService();
        $routers = $service->all();

        //去除版本
        $replaceRoutes = array_map(function ($value) {
            return $this->routeFormat($value);
        }, $routers);

        $topRoutes = $this->getModel()->getQuery(['pid' => 0])->column('id', 'route');

        $hash = array_combine($replaceRoutes, $routers);

        $model = $this->getModel();
        $auth  = $this->getQuery()->column('route');

        $diffRoute = array_diff(array_unique($replaceRoutes), $auth);

        $append = [];

        foreach ($diffRoute as $route) {
            $rule = '#^(?<module>\w+)/#';

            preg_match($rule, $route, $match);

            if (!empty($match['module'])) {
                $topRoute = dirname($route);
                $method   = basename($route);

                if (empty($topRoutes[$topRoute])) {
                    $top = $this->getModel()->add([
                        'name'    => $service->getClassNameByRoute($hash[$route]) . '管理',
                        'route'   => $topRoute,
                        'module'  => $match['module'],
//                        'url'     => substr($topRoute, strpos($topRoute, '/') + 1) . '/index',
                        'url'     => '',
                        'status'  => 1,
                        'pid'     => 0,
                        'is_menu' => 1,
                    ]);

                    if ($top) {
                        $topRoutes[$topRoute] = $top->id;
                    }
                }
                $isMenu   = in_array($method, ['index']) ? 1 : 0;
                $append[] = [
                    'name'    => $service->getMethodNameByRoute($hash[$route]),
                    'route'   => $route,
                    'url'     => substr($route, strpos($route, '/') + 1),
                    'module'  => $match['module'],
                    'status'  => 1,
                    'pid'     => $topRoutes[$topRoute],
                    'is_menu' => $isMenu,
                ];
            }
        }

        return $model->saveAll($append);
    }

    /**
     * 路由地址格式化
     * @param $route
     * @return string|string[]|null
     */
    public function routeFormat($route)
    {
        $value = str_replace('/_', '/', trim_version(Str::snake($route)));
        return $value;
    }
}
