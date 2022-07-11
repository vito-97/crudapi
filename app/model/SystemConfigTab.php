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

    /**
     * 搜索
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title', 'like', "%{$value}%");
    }

    /**
     * 获取配置信息
     * @param $value
     * @param $data
     * @return array|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getConfigAttr($value, $data)
    {
        static $config;
        $id = $this->id;

        if (is_null($config)) {
            $logic  = new SystemConfigLogic();
            $config = $logic->getConfigTree();
        }

        $result = $config[$id] ?? [];

        //过滤了隐藏状态
        foreach ($result as $key => $item) {
            if (!$item['status']) {
                unset($result[$key]);
            }
        }

        sort($result);

        return $result;
    }
}