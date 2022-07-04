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
    //设备
    Route::resource('device', 'Device');
    //取水客户
    Route::resource('customer', 'Customer');
    //水厂
    Route::resource('waterworks', 'Waterworks');
    //套餐
    Route::resource('product', 'Product');
    //合同
    Route::group('contract', function () {
        Route::get('history', 'history');
    })->prefix('Contract/');
    Route::resource('contract', 'Contract');
    //仪表盘
    Route::get('dashboard', 'Dashboard/index');
    //附件
    Route::resource('attachment', 'Attachment');
    //通联支付
    Route::group('all_in_pay', function () {
        Route::get('', 'read');
        Route::put('', 'update');
    })->prefix('AllInPay/');
    Route::group('order', function () {
        Route::get('history', 'history');
    })->prefix('Order/');
    //流量
    Route::group('flow', function () {
        Route::get('history', 'history');
        Route::get('used', 'used');
        Route::get('surplus', 'surplus');
    })->prefix('Flow/');
    //用户
    Route::group('water_company', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('WaterCompany/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});