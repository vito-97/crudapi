<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 15:10
 */

namespace app\admin\middleware;


use think\facade\Log;
use think\Request;

class AdminLogMiddleware
{
    //后台操作记录
    public function handle(Request $request, \Closure $next)
    {
        return $next($request);
    }

    public function end(){
//        Log::write('this is end log');
    }
}