<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user;

use app\admin\curd\Index;
use app\common\Enum;
use app\validate\UserValidate;

class UserIndex extends Index
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
    protected $with = ['agent'];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $queryField = ['sex', 'status', 'agent_id', 'type'];

    protected $validate = [
        UserValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $labelCallback = [
        'get_status_enum'   => ['name' => '状态'],
        'get_platform_enum' => ['name' => '类型'],
        'get_sex_enum'      => ['name' => '性别'],
        'get_type_enum'     => ['name' => '用户类型'],
    ];

}
