<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:22
 */

use app\common\ErrorCode;
use think\facade\Route;

Route::group('<api_version>', function () {
    Route::group('device', function () {
        Route::get('state', 'state');
    })->prefix('Device/');
    //设备
    Route::resource('device', 'Device');
    //设备报修
    Route::resource('device_repair', 'DeviceRepair');
    //优惠券管理员
    Route::resource('coupon_user', 'CouponUser');
    //套餐
    Route::resource('product', 'Product');
    //用户
    Route::resource('user', 'User');
    //运维用户
    Route::resource('repair_user', 'RepairUser');

    //订单
    Route::group('order', function () {
        Route::post('create', 'create');
        Route::get('pay', 'pay');
        Route::get('status', 'status');
        Route::get('detail', 'detail');
        //支付同步
        Route::get('callback', 'callback');
        //历史数据
        Route::get('history', 'history');
    })->prefix('Order/');

    Route::resource('order', 'Order');

    //服务费
    Route::resource('service_charge', 'ServiceCharge');
    //现金券
    Route::resource('cash_coupon', 'CashCoupon');
    //现金券领取
    Route::resource('cash_coupon_card', 'CashCouponCard');
    //服务费
    Route::resource('service_charge', 'ServiceCharge')->only(['index', 'read']);
    //仪表盘
    Route::get('dashboard', 'Dashboard/index');
    //附件
    Route::resource('attachment', 'Attachment');
    //广告
    Route::resource('adverts', 'Adverts');

    //用户
    Route::group('agent', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('Agent/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});