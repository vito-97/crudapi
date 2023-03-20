<?php
/**
 * Created by PhpStorm.
 * User: vito
 * Date: 2022/11/1
 * Time: 16:40
 */

namespace app\model\traits;


trait ScopeTypeTrait
{
    protected $auto = ['type'];

    /**
     * 类型
     * @param $query
     */
    public function scopeType($query)
    {
        if (static::SCOPE_TYPE) {
            $query->where('type', static::SCOPE_TYPE);
        }
    }

    protected function setTypeAttr($value)
    {
        if (static::SCOPE_TYPE) {
            return static::SCOPE_TYPE;
        }

        return $value;
    }
}
