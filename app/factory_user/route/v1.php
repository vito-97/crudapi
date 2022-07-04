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
    Route::resource('device', 'Device')->except(['delete']);
    //设备控制测试
    Route::group('device_control_test', function () {

        Route::post('<action>', '<action>')->pattern(['action'=> 'start|pause|finish|clear|flow|temperature|pulse|qrcode|deviceNo|advertsLight']);

    })->prefix('DeviceControlTest/');
    //用户
    Route::group('factory_user', function () {
        //详情
        Route::get('detail', 'detail');
        //个人信息修改
        Route::post('profile', 'profile');
    })->prefix('FactoryUser/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});