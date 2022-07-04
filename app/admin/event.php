<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:55
 */

use \app\common\EventName;
use \app\admin\listener\AdminLoginListener;

return [
    'listen' => [
        EventName::NOT_AUTH_VISIT => [],
        EventName::ADMIN_LOGIN => [
            AdminLoginListener::class,
        ],
        EventName::ADMIN_LOGOUT => [],
        EventName::ADMIN_DASHBOARD => [
            \app\admin\listener\dashboard\DashboardListener::class,
        ],
    ],
];
