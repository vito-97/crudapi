<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\UserScopeTrait;

class FactoryUser extends User
{
    use UserScopeTrait;

    const USER_TYPE = self::FACTORY_TYPE;

    protected $scene = [
        'api' => [
            'visible' => ['id', 'nickname', 'username', 'real_name', 'tel', 'avatar', 'email', 'last_login_ip', 'last_login_time', 'create_time'],
        ],
    ];
}
