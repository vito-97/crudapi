<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 15:38
 */

use \think\facade\Route;
use \app\admin\middleware\AdminAuthTokenMiddleware;
use \app\admin\middleware\AdminLogMiddleware;
$rest = Route::getRest();
//卸载掉create资源路由
unset($rest['create']);
Route::rest($rest, true);
//添加新的资源路由
Route::rest('change', ['PUT', '/<id>/change', 'change']);

//登录
Route::post('login', 'Login/login');
//登出
Route::post('logout', 'Login/logout')->middleware([AdminAuthTokenMiddleware::class, AdminLogMiddleware::class]);

Route::get('test','Test/index');