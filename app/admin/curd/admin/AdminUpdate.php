<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 15:33
 */

namespace app\admin\curd\admin;


use app\common\curd\Update;
use app\common\Enum;
use app\validate\AdminValidate;

class AdminUpdate extends Update
{
    //验证器
    protected $validate = [
        AdminValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['nickname', 'status', 'password', 'role_id', 'tel', 'email', 'mark', 'disabled_mark'];
    //排除的数据
    protected $exclude = [1];
    //条件
    protected $where = [];
}