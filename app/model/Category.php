<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\model;

use app\model\traits\TreeTrait;
use think\db\Query;

class Category extends BaseModel
{
    use TreeTrait;

    public $langStatus = false;

    protected $langModelName = 'CategoryLang';

    protected $name = 'Category';

    const POSTS_TYPE   = 1;

    protected $typeEnum = [
        self::POSTS_TYPE   => '文章',
    ];

    protected $currentType = 0;

    protected $globalScope = ['type'];

    protected $auto = ['type'];

    /**
     * 类型
     * @param $query
     */
    public function scopeType($query)
    {
        if ($this->currentType) {
            $query->where('__TABLE__.type', $this->currentType);
        }
    }

    protected function setTypeAttr($value)
    {
        if ($this->currentType) {
            return $this->currentType;
        }

        return $value;
    }

    public function scopeSort(Query $query)
    {
        $query->order(['__TABLE__.sort' => 'desc', '__TABLE__.id' => 'asc']);
    }

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $this->searchRelationLang($query, 'name|index', '%' . $value . '%');

//        return $query->where('name|index', 'like', '%' . $value . '%');
    }
}
