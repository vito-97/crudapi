<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/7
 * Time: 17:31
 */

namespace app\model\traits;

trait CouponScopeTrait
{
    public function scopeType($query)
    {
        $query->where('type', $this->scopeType);
    }

    /**
     * 获取类型描述
     * @param $value
     * @param $data
     * @return array|mixed|string
     */
    protected function getTypeDescAttr($value, $data)
    {
        return $this->getEnumDesc('type', $data);
    }
}