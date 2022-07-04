<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\DeviceTrait;
use app\model\traits\UserTrait;

class Flow extends BaseModel
{
    use UserTrait;
    use DeviceTrait;
}
