<?php
// +----------------------------------------------------------------------
// | 控制台配置
// +----------------------------------------------------------------------
return [
    // 指令定义
    'commands' => [
        'make:class' => \app\command\MakeClass::class,
        'make:crud'  => \app\command\MakeCrud::class,
        'make:lang'  => \app\command\MakeLang::class,
        'timer'      => \app\command\Timer::class,
        'mqtt'       => \app\command\Mqtt::class,
        'async_task' => \app\command\AsyncTask::class
    ],
];
