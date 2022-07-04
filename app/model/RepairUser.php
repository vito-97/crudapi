<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\AgentTrait;
use app\model\traits\UserScopeTrait;

class RepairUser extends User
{
    use UserScopeTrait;
    use AgentTrait;

    const USER_TYPE = self::REPAIR_TYPE;
}
