<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/12
 * Time: 10:16
 */

namespace app\model\traits;


use think\db\Query;

trait SiteScopeTrait
{
    public function scopeSite(Query $query, $id)
    {
        $this->scopeFiled($query, 'site_id', [0, $id]);
    }
}