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
    //服务费
    Route::resource('service_charge', 'ServiceCharge')->only(['index', 'read']);
    //仪表盘
    Route::get('dashboard', 'Dashboard/index');
    //附件
    Route::resource('attachment', 'Attachment');
    //流量
    Route::group('flow', function () {
        Route::get('history', 'history');
        Route::get('used', 'used');
    })->prefix('Flow/');
    //用户
    Route::group('waterworks', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('Waterworks/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});