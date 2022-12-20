<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:20
 */

$isDev = isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] === 'water.cn';

return [
    'is_dev'           => $isDev,
    //授权登录的KEY
    'auth_token_key'   => 'access-token',
];
