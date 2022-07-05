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
    //取水员
    Route::resource('water_fetcher', 'WaterFetcher');
    //仪表盘
    Route::get('dashboard', 'Dashboard/index');
    //附件
    Route::resource('attachment', 'Attachment');
    //流量
    Route::group('flow', function () {
        Route::get('history', 'history');
        Route::get('used', 'used');
    })->prefix('Flow/');
    //合同
    Route::group('contract', function () {
        Route::get('history', 'history');
    })->prefix('Contract/');
    Route::resource('contract', 'Contract')->only(['index', 'read']);
    //用户
    Route::group('customer', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('Customer/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});