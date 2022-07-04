<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;


class SystemLog extends BaseModel
{
    const ADMIN_TYPE = 1;
    const AGENT_TYPE = 2;
    const USER_TYPE = 3;

    protected $typeEnum = [
        self::ADMIN_TYPE => '管理端',
        self::AGENT_TYPE => '代理端',
        self::USER_TYPE => '客户端',
    ];
}