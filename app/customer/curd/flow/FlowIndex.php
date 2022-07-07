<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\flow;

use app\common\curd\Index;

class FlowIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加标签数据
    protected $labelCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = ['device', 'user'];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = [];
}