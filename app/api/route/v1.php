<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:22
 */

use app\http\middleware\UserAuthTokenMiddleware;
use think\facade\Route;

define('USER_AUTH_MIDDLEWARE', [UserAuthTokenMiddleware::class, [\app\service\TokenService::USER]]);

Route::group('<api_version>', function () {
    //微信接口
    Route::group('wechat', function () {
        Route::any('message', 'index');
        Route::post('login', 'login');
        Route::post('callback', 'callback')->name('wechat_login_callback');

    })->prefix('Wechat/');

    //用户
    Route::group('user', function () {
        //详情
        Route::get('detail', 'detail');
    })->prefix('User/')->middleware([USER_AUTH_MIDDLEWARE]);

})->prefix('<api_version>.');
