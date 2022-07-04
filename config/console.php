<?php
// +----------------------------------------------------------------------
// | 控制台配置
// +----------------------------------------------------------------------
return [
    // 指令定义
    'commands' => [
        'make:class'             => \app\command\MakeClass::class,
        'make:curd'              => \app\command\MakeCurd::class,
        'make:lang'              => \app\command\MakeLang::class,
        'mqtt'                   => \app\command\Mqtt::class,
        'device_control_timeout' => \app\command\DeviceControlTimeout::class,
    ],
];
