<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/6
 * Time: 14:26
 */

namespace app\model\traits;


use app\model\WaterFetcher;
use think\db\Query;

trait CustomerWaterFetcherScopeTrait
{
    public function scopeCustomerWaterFetcher(Query $query, $uid)
    {
        $query->where('user_id', 'EXP', 'IN' . WaterFetcher::field('id')->buildSql());
    }
}