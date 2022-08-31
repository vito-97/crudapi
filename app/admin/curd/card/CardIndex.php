<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\card;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\CardValidate;

class CardIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $with = ['agent', 'user'];

    protected $queryField = [
        'status', 'agent_id',
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];

    protected $validate = [
        CardValidate::class => Enum::VALID_LIST_SCENE,
    ];
}
