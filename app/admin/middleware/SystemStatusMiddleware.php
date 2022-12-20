<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/11
 * Time: 15:01
 */

namespace app\admin\middleware;

use app\exception\SystemIsClosedException;
use app\logic\SystemConfigLogic;
use think\Request;

class SystemStatusMiddleware
{
    /**
     * 网站后台是否关闭中间件
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     * @throws SystemIsClosedException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function handle(Request $request, \Closure $next)
    {
        $response = $next($request);

        $user     = $request->getUser();
        $userinfo = $user ? $user->getUserInfo() : false;
        if ($userinfo) {
            $role = $userinfo->role;
            //只有非超管角色才进入判断网站后台状态
            if (!$role->isSuper()) {
                $logic = new SystemConfigLogic();
                $status = $logic->config('close_system');

                if ($status) {
                    throw new SystemIsClosedException();
                }
            }


        }

        return $response;
    }
}
