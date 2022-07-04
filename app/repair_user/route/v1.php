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
    //仪表盘
    Route::get('dashboard', 'Dashboard/index');
    //设备
    Route::resource('device', 'Device')->except(['delete']);
    //设备控制测试
    Route::group('device_control_test', function () {

        Route::post('<action>', '<action>')->pattern(['action'=> 'start|pause|finish|clear|flow|temperature|pulse|qrcode|deviceNo|advertsLight']);

    })->prefix('DeviceControlTest/');
    //设备报修
    Route::resource('device_repair', 'DeviceRepair')->except(['delete']);
    //用户
    Route::group('repair_user', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('RepairUser/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});