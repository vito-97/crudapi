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
    //更新个人信息接口
    Route::put('profile', 'Profile/update');
    //广告
    Route::resource('adverts', 'Adverts');
    //权限
    Route::group('system_auth', function () {
        //刷新权限
        Route::post('flush', 'flush');
    })->prefix('SystemAuth/');
    Route::resource('system_auth', 'SystemAuth');

    //配置
    Route::put('system_config/config', 'SystemConfig/config');
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

})->prefix('<api_version>.')->middleware([AdminAuthTokenMiddleware::class, AdminCheckAuthMiddleware::class]);

//miss路由
Route::miss(function () {
    return error(ErrorCode::ROUTE_NOT_FOUND);
});
