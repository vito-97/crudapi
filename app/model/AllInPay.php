<?php
declare (strict_types = 1);

namespace app\model;

use app\model\traits\AgentTrait;
use think\db\Query;

class AllInPay extends BaseModel
{
    use AgentTrait;

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('app_id|cus_id', $value);
    }
}
