<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;

use app\common\Util;
use app\model\traits\AdminTrait;
use think\db\Query;

class Adverts extends BaseModel
{
    use AdminTrait;

    protected $append = ['status_desc'];

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title', 'like', '%' . $value . '%');
    }

    protected function getImageAttr($value)
    {
        return Util::link($value);
    }
}