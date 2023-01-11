<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/15
 * Time: 22:32
 */

namespace app\http\middleware;

use app\Request;

class DefaultAppMiddleware
{
    public function handle(Request $request, \Closure $next)
    {
        // 默认应用文件夹名
        $defaultApp = config('app.default_app');

        // 其他子应用文件夹名字
        $appList = config('app.app_list');

        $pathArray = explode('/', $request->pathinfo());
        $appName   = $pathArray[0];
        // 循环匹配子应用，如果匹配到了，说明访问的是子应用
        foreach ($appList as $val) {
            if (preg_match('/' . $val . '/i', $appName)) {
                return $next($request);
            }
        }

        if ($appName !== $defaultApp) {
            // 没有匹配到，则是访问的默认应用
            // 需要 hook 修改 pathinfo 信息，便于 topthink/think-multi-app 包的使用
            array_unshift($pathArray, $defaultApp);
            // 设置为默认应用
            $request->setPathinfo(join('/', $pathArray));
        }

        return $next($request);
    }
}
