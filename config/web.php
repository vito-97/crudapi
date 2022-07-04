<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:20
 */

$isDev = isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] === 'water.cn';

if ($isDev) {
    $clientHost     = 'http://localhost:8080/';
    $agentHost      = 'http://localhost:8081/';
    $waterworksHost = 'http://localhost:8082/';
} else {
    $clientHost     = 'https://h5.aijkl.com/';
    $agentHost      = 'https://agent.aijkl.com/';
    $waterworksHost = 'https://waterworks.aijkl.com/';
}

return [
    'is_dev'         => $isDev,
    //授权登录的KEY
    'auth_token_key' => 'access-token',
    //默认支付驱动
    'payment'        => [
        'default' => 'allInPay',
    ],

    'client_host'         => $clientHost,
    'agent_host'          => $agentHost,
    'waterworks'          => $waterworksHost,
    //维护员端
    'repair_host'         => 'http://mainten.aijkl.com/',
    //注册地址
    'repair_register_uri' => 'pages/register/register',
    //短链
    'short_host'          => 'https://s.aijkl.com/',
];