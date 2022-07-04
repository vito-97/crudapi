<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\withdrawal;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\WithdrawalValidate;

class WithdrawalIndex extends Index
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

    protected $queryField = ['user_id', 'status'];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
    ];

    protected $validate = [
        WithdrawalValidate::class => Enum::VALID_LIST_SCENE,
    ];
}