<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 11:52
 */

namespace app\admin\curd\admin;


use app\common\curd\Index;
use app\common\Enum;
use app\validate\AdminValidate;

class AdminIndex extends Index
{
    use AdminCurdTrait;

    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //追加标签
    protected $labelCallback = [
        'get_role_label' => ['name' => '角色', 'field' => 'role_id', 'key' => 'role'],
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
    //查询条件
    protected $where = [];
    /**
     * @var string[] 查询条件
     */
    protected $queryField = [
        'status', 'role_id',
    ];

    protected $validate = [
        AdminValidate::class => Enum::VALID_LIST_SCENE,
    ];
}