<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:20
 */

$isDev = isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] === 'water.cn';

if ($isDev) {
    $clientHost     = 'http://h5.water.cn:8880/';
    $agentHost      = 'http://agent.waetr.cn:8881/';
    $waterworksHost = 'http://localhost:8082/';
} else {
    $clientHost     = 'https://h5.aijkl.com/';
    $agentHost      = 'https://agent.aijkl.com/';
    $waterworksHost = 'https://waterworks.aijkl.com/';
}

return [
    'is_dev'           => $isDev,
    //系统访问日志是否启用延时队列去记录
    'system_log_queue' => false,
    //授权登录的KEY
    'auth_token_key'   => 'access-token',
    //默认支付驱动
    'payment'          => [
        'default' => 'allInPay',
    ],

    'client_host'         => $clientHost,
    'agent_host'          => $agentHost,
    'waterworks'          => $waterworksHost,
    //维护员端
    'repair_host'         => 'http://mainten.aijkl.com/',
    //注册地址
    'repair_register_uri' => 'pages/register/register',
    //取水员注册地址
    'water_fetcher_uri'   => 'pages/water_fetcher/register',
    //短链
    'short_host'          => 'https://s.aijkl.com/',
];
