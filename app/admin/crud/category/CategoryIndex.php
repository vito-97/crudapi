<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\category;

use app\admin\crud\Index;
use think\model\Relation;

class CategoryIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'    => ['name' => '状态', 'key' => 'status'],
        'get_is_show_switch' => ['name' => '展示', 'key' => 'is_show'],
    ];
    //查询条件
    protected $where = ['__TABLE__.pid' => 0];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];

    protected $order = [];

    protected $scope = ['sort'];

    protected $withCountSubQuery = false;
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = [];

    protected function init($next)
    {
        $this->with = [
            'children' => function (Relation $relation) {
                $relation->scope(['sort'])->with($this->with)->withCount($this->withCount, $this->withCountSubQuery);
            }
        ];

        return $next();
    }
}
