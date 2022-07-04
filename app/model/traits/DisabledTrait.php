<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/10
 * Time: 10:37
 */

namespace app\model\traits;


trait DisabledTrait
{
    protected $disabledEnum = self::SWITCH_ENUM;

    public function isDisabled()
    {
        return self::SWITCH_ON === $this->getData('disabled');
    }
}