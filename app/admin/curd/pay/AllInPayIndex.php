<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\pay;

use app\common\curd\Index;

class AllInPayIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = ['agent'];

    protected $queryField = ['agent_id'];
}