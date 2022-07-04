<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/7
 * Time: 14:30
 */

use \app\common\EventName;

return [
    'listen' => [
        EventName::USER_LOGIN      => [
            \app\listener\UserLoginListener::class,
        ],
        EventName::WATERWORKS_DASHBOARD => [
            \app\waterworks\listener\dashboard\DashboardListener::class,
        ],
    ],
];
