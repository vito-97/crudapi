<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/30
 * Time: 16:08
 */

namespace app\model;

use app\model\traits\UserScopeTrait;

class Member extends User
{
    use UserScopeTrait;

    const USER_TYPE = 0;

    protected $useSiteScope = false;
}
