<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 15:21
 */
use think\facade\Route;

//登录
Route::group('login', function () {
    //登录
    Route::post('login', 'login');
    //游客登录
    Route::post('tourist', 'tourist');

})->prefix('Login/');

Route::get('captcha', 'Captcha/index');

Route::any('test/<type>', 'Test/index');
