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
    Route::any('wechat', 'Wechat/index');
    //支付
    Route::group('pay', function () {
        //支付链接
        Route::post('pay', 'pay');
        //同步回调
        Route::any('callback', 'callback');
        //退款
        Route::any('refund', 'refund');

    })->prefix('Pay/')->middleware([USER_AUTH_MIDDLEWARE]);

    //支付异步通知
    Route::post('pay/notify', 'Pay/notify');

    //套餐
    Route::group('product', function () {
        Route::get('', 'index');
    })->prefix('Product/');

    Route::group('adverts', function () {
        Route::get('', 'index');
    })->prefix('Adverts/');

    //设备
    Route::group('device', function () {
        //启动
        Route::post('start', 'start');
        //暂停
        Route::post('pause', 'pause');
        //完成
        Route::post('finish', 'finish');
        //详情
        Route::get('detail', 'detail');
        //设置
        Route::post('setting', 'setting');
        //获取设备的最新状态
        Route::get('useing', 'useing');

    })->prefix('Device/')->middleware([USER_AUTH_MIDDLEWARE]);

    //订单
    Route::group('order', function () {
        Route::post('create', 'create');
        Route::get('detail', 'detail');
        Route::get('status', 'status');
    })->prefix('Order/')->middleware([USER_AUTH_MIDDLEWARE]);

    //用户
    Route::group('user', function () {
        //详情
        Route::get('detail', 'detail');
    })->prefix('User/')->middleware([USER_AUTH_MIDDLEWARE]);

})->prefix('<api_version>.');