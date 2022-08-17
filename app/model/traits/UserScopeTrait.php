<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/7
 * Time: 17:44
 */

namespace app\model\traits;


trait UserScopeTrait
{
    protected $auto = ['type'];

    /**
     * 运营商类型
     * @param $query
     */
    public function scopeType($query)
    {
        if (self::USER_TYPE) {
            $query->where('type', self::USER_TYPE);
        }
    }

    protected function setTypeAttr($value)
    {
        if (self::USER_TYPE) {
            return self::USER_TYPE;
        }

        return $value;
    }
}
