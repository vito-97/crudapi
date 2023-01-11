<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user_oauth;

use app\admin\curd\Index;
use app\common\Enum;
use app\validate\UserOauthValidate;

class UserOauthIndex extends Index
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
    //关联
    protected $with = [];

    protected $queryField = ['status', 'sex', 'type', 'user_id'];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_type_enum' => ['name' => '类型'],
        'get_sex_enum' => ['name' => '性别'],
    ];

    protected $validate = [
        UserOauthValidate::class => Enum::VALID_LIST_SCENE,
    ];
}
