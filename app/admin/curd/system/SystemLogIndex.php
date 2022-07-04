<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\SystemLogValidate;

class SystemLogIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];

    protected $queryField = ['user_id', 'type'];

    protected $labelCallback = [
        'get_type_enum' => ['name' => '类型'],
    ];

    protected $validate = [
        SystemLogValidate::class => Enum::VALID_LIST_SCENE,
    ];
}