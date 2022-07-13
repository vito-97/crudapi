<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/13
 * Time: 9:35
 */

namespace app\model\traits;

use app\common\Util;

trait AvatarAttrTrait
{
    protected function getAvatarAttr($value)
    {
        return Util::link($value);
    }
}