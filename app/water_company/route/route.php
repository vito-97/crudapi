<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 15:21
 */

use app\http\middleware\UserAuthTokenMiddleware;
use think\facade\Route;

$rest = Route::getRest();
//卸载掉create资源路由
unset($rest['create']);
Route::rest($rest, true);
//添加新的资源路由
Route::rest('change', ['PUT', '/<id>/change', 'change']);

define('USER_AUTH_MIDDLEWARE', [UserAuthTokenMiddleware::class, [\app\service\TokenService::WATER_COMPANY]]);

//登录
Route::group('login', function () {
    //登录
    Route::post('login', 'login');
    Route::post('logout', 'logout')->middleware([USER_AUTH_MIDDLEWARE]);
})->prefix('Login/');