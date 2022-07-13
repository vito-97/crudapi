<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\UserScopeTrait;

class WaterCompany extends User
{
    use UserScopeTrait;

    protected $useSiteScope = false;

    const USER_TYPE = self::WATER_COMPANY_TYPE;
}
