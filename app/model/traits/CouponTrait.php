<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/2
 * Time: 11:02
 */

namespace app\model\traits;


trait CouponTrait
{

    public function setGetStartTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    public function setGetEndTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    public function setUseStartTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    public function setUseEndTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }
}