<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:57
 */

namespace app\model;


use think\db\Query;

class SystemConfig extends BaseModel
{
    protected $type = [
        'value' => 'json',
        'opts'  => 'json',
        'list'  => 'json',
    ];

    protected function getValueAttr($value)
    {
        if ($value) {
            return json_decode($value, true);
        }

        return '';
    }

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('name|desc', 'like', "%{$value}%");
    }
}