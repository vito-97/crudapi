<?php
declare (strict_types=1);

namespace app\model;


use think\db\Query;

class DeviceAppVersion extends BaseModel
{
    protected $isNewEnum = self::SWITCH_ENUM;

    protected $isForceEnum = self::SWITCH_ENUM;

    protected function setContentAttr($value)
    {
        return remove_xss($value);
    }

    /**
     * 搜索列表
     * @param Query $query
     * @param $value
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $query->where('title|content', 'like', "%{$value}%");
    }
}
