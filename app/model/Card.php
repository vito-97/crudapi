<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;


use app\model\traits\AgentTrait;
use app\model\traits\UserTrait;
use think\db\Query;

class Card extends BaseModel
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
        return $query->where('card_no', $value);
    }
}