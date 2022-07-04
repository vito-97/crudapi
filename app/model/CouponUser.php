<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\UserScopeTrait;

class CouponUser extends User
{
    use UserScopeTrait;

    const USER_TYPE = self::COUPON_TYPE;
}
