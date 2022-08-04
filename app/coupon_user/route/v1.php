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
    //现金券
    Route::resource('cash_coupon', 'CashCoupon')->except(['save']);
    //现金券领取
    Route::resource('cash_coupon_card', 'CashCouponCard')->only(['index', 'read', 'change']);

    //流量券
    Route::resource('flow_coupon', 'FlowCoupon')->except(['save']);
    //流量券领取
    Route::resource('flow_coupon_card', 'FlowCouponCard')->only(['index', 'read', 'change']);

    //用户
    Route::group('coupon_user', function () {
        //详情
        Route::get('detail', 'detail');
        Route::post('profile', 'profile');
    })->prefix('CouponUser/');

})->prefix('<api_version>.')->allowCrossDomain()->middleware([USER_AUTH_MIDDLEWARE]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});
