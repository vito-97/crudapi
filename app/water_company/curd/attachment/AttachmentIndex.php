<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\attachment;

use app\water_company\curd\Index;

class AttachmentIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加标签数据
    protected $labelCallback = [
        'get_category_enum' => ['name' => '分类', 'key' => 'category'],
    ];
    protected $append = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['category', 'type'];
}