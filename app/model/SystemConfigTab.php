<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:58
 */

namespace app\model;

use app\logic\SystemConfigLogic;
use app\model\traits\TreeTrait;
use think\db\Query;

class SystemConfigTab extends BaseModel
{
    use TreeTrait;

    /**
     * 关联父类
     * @return \think\model\relation\BelongsTo
     */
    public function parent()
    {
        return $this->belongsTo('SystemConfigTab', 'pid', 'id');
    }

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title', 'like', "%{$value}%");
    }

    protected function getConfigAttr($value, $data)
    {
        static $config;
        $id = $this->id;

        if (is_null($config)) {
            $logic  = new SystemConfigLogic();
            $config = $logic->getConfigTree();
        }

        return $config[$id] ?? [];
    }
}