<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\CustomerTrait;
use app\model\traits\WaterCompanyTrait;
use think\db\Query;

class Contract extends BaseModel
{
    use WaterCompanyTrait;
    use CustomerTrait;

    public function scopeWaterCompany(Query $query, $id)
    {
        $this->scopeFiled($query, 'water_company_id', $id);
    }

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title|number', 'like', '%' . $value . '%');
    }
}
