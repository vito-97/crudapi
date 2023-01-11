<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\model;

use app\model\traits\IpTrait;
use app\model\traits\PostsAttributeTrait;
use think\db\Query;
use think\facade\App;
use think\Model;

class Posts extends BaseModel
{
    use IpTrait;
    use PostsAttributeTrait;

    public $langStatus = false;

    public function category()
    {
        return $this->belongsTo('PostsCategory', 'category_id');
    }

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $field = 'title|content|author|source';
        $this->searchRelationLang($query, $field, '%' . $value . '%');
    }

    public function getIpAttr($value)
    {
        return $this->_getIpAttr($value);
    }

    public function setIpAttr($value)
    {
        return $this->_setIpAttr($value);
    }

    public static function onBeforeInsert(Model $model)
    {
        $model->ip = App::getInstance()->request->ip();
    }

    public function scopeSort(Query $query)
    {
        $query->order(['__TABLE__.is_top' => 'desc', '__TABLE__.create_time' => 'desc']);
    }

    public function scopeTime(Query $query)
    {
        $query->where('__TABLE__.create_time', '<=', time());
    }
}
