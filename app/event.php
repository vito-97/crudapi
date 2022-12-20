<?php

use app\common\EventName;

// 事件定义文件
return [
    'bind' => [
    ],

    'listen' => [
        'AppInit'                         => [],
        'HttpRun'                         => [],
        'HttpEnd'                         => [],
        'LogLevel'                        => [],
        'LogWrite'                        => [],
        //MQTT订阅
        EventName::MQTT_SUBSCRIBE_MSG     => [
        ],
        //用户详情
        EventName::GET_USER_DETAIL        => [
        ],
    ],

    'subscribe' => [
    ],
];
