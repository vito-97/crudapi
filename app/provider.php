<?php
use app\Request;
use app\exception\ExceptionHandle;
// 容器Provider定义文件

return [
    'think\Request'          => Request::class,
    'think\exception\Handle' => ExceptionHandle::class
];
