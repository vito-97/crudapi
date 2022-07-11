<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 14:08
 */
return [
    'middleware' => [
        \app\admin\middleware\SystemStatusMiddleware::class,
        \app\http\middleware\SystemLogMiddleware::class,
    ],
];
