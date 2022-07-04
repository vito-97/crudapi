<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\adverts;

use app\waterworks\curd\Index;

class AdvertsIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'       => ['name' => '状态'],
    ];
    //查询条件
    protected $where = [];
    //字段
    protected $field = ['agent_id'];
    //排除字段
    protected $withoutField = true;
    //关联
    protected $with = [];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['status'];
}