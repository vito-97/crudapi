<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 17:18
 */

use app\admin\middleware\AdminAuthTokenMiddleware;
use app\admin\middleware\AdminCheckAuthMiddleware;
use app\common\ErrorCode;
use think\facade\Route;

Route::group('<api_version>', function () {
    //仪表盘
    Route::group('dashboard', function () {
        Route::get('', 'index');
    })->prefix('Dashboard/');
    //附件
    Route::resource('attachment', 'Attachment');
    //管理员
    Route::group('admin', function () {
        //个人信息
        Route::get('info', 'info');
    })->prefix('Admin/');
    Route::resource('admin', 'Admin');
    //代理
    Route::resource('agent', 'Agent');
    //出厂设置员
    Route::resource('factory_user', 'FactoryUser');
    //运营商维护员
    Route::resource('repair_user', 'RepairUser');
    //水务公司
    Route::resource('water_company', 'WaterCompany');
    //水厂
    Route::resource('waterworks', 'Waterworks');
    //取水客户
    Route::resource('customer', 'Customer');
    //取水员
    Route::resource('water_fetcher', 'WaterFetcher');
    //广告
    Route::resource('adverts', 'Adverts');
    //通联支付
    Route::resource('all_in_pay', 'AllInPay');
    //IC卡
    Route::resource('card', 'Card');
    //优惠券
    Route::resource('coupon', 'Coupon');
    //优惠券领取列表
    Route::resource('coupon_card', 'CouponCard');
    //现金券
    Route::resource('cash_coupon', 'CashCoupon');
    //现金券领取列表
    Route::resource('cash_coupon_card', 'CashCouponCard');
    //服务费
    Route::resource('service_charge', 'ServiceCharge');
    //设备
    Route::group('device', function () {
        Route::get('state', 'state');
    })->prefix('Device/');

    Route::resource('device', 'Device');
    //设备控制记录
    Route::resource('device_control', 'DeviceControl');
    //设备APP版本
    Route::resource('device_app_version', 'DeviceAppVersion');
    //订单
    Route::resource('order', 'Order');
    //套餐
    Route::resource('product', 'Product');

    //权限
    Route::group('system_auth', function () {
        //刷新权限
        Route::post('flush', 'flush');
    })->prefix('SystemAuth/');
    //资源路由放后面
    Route::resource('system_auth', 'SystemAuth');

    //配置
    Route::resource('system_config', 'SystemConfig');
    //配置分类
    Route::resource('system_config_tab', 'SystemConfigTab');
    //日志类
    Route::resource('system_log', 'SystemLog')->only(['index', 'delete', 'read']);

    //角色
    Route::group('system_role', function () {
        //获取菜单
        Route::get('menu', 'menu');
        //获取权限
        Route::get('role', 'role');
    })->prefix('SystemRole/');
    Route::resource('system_role', 'SystemRole');

    //用户
    Route::resource('user', 'User');
    //用户第三方授权
    Route::resource('user_oauth', 'UserOauth');
    //用户返利表
    Route::resource('user_rebate', 'UserRebate');
    //用户钱包
    Route::resource('user_wallet', 'UserWallet');
    //提现
    Route::resource('withdrawal', 'Withdrawal');

})->prefix('<api_version>.')->middleware([AdminAuthTokenMiddleware::class, AdminCheckAuthMiddleware::class]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});
