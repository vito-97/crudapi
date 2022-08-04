<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/3
 * Time: 17:26
 */
use think\facade\Route;

Route::rule('<device_no>', 'short/Device/index')->pattern(['device_no' => '\d{6}']);

Route::miss(function (){
   return '居科乐加水机';
});
