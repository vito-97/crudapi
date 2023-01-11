<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts;

use app\admin\curd\Index;
use app\logic\PostsCategoryLogic;

class PostsIndex extends Index
{
    protected $fetchSql = false;
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_is_top_switch' => ['name' => '置顶', 'key' => 'is_top'],
        'get_category_label' => ['name' => '分类', 'key' => 'category']
    ];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = ['category'];

    protected $scope = ['sort'];

    protected $order = [];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = [];

    public function getCategoryLabel()
    {
        return (new PostsCategoryLogic())->getLabel();
    }
}
