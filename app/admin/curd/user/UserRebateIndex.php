<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\UserRebateValidate;

class UserRebateIndex extends Index
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

    protected $queryField = ['order_id', 'user_id', 'type', 'status', 'pm'];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_pm_enum' => ['name' => '支出/收入'],
    ];

    protected $validate = [
        UserRebateValidate::class => Enum::VALID_LIST_SCENE,
    ];
}