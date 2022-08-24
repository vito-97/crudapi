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

    //现金券
    Route::group('cash_coupon', function () {
        //领取
        Route::post('receive', 'receive');
    })->prefix('CashCoupon/')->middleware([USER_AUTH_MIDDLEWARE]);

    //流量券
    Route::resource('flow_coupon', 'FlowCoupon')->only(['read']);
    Route::group('flow_coupon', function () {
        //领取
        Route::post('receive', 'receive');
    })->prefix('FlowCoupon/')->middleware([USER_AUTH_MIDDLEWARE]);

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

    Route::resource('device','Device')->only(['index'])->middleware([USER_AUTH_MIDDLEWARE]);

    //订单
    Route::group('order', function () {
        Route::post('create', 'create')->middleware([USER_AUTH_MIDDLEWARE]);
        Route::get('detail', 'detail');
        Route::get('status', 'status');
    })->prefix('Order/');

    //用户
    Route::group('user', function () {
        //详情
        Route::get('detail', 'detail');
    })->prefix('User/')->middleware([USER_AUTH_MIDDLEWARE]);

    Route::group('water_fetcher', function () {
        //注册
        Route::post('register', 'register');
        //详情
        Route::post('bind', 'bind');
    })->prefix('WaterFetcher/')->middleware([USER_AUTH_MIDDLEWARE]);

})->prefix('<api_version>.');
