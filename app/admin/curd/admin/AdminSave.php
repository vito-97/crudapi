<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 16:12
 */

namespace app\admin\curd\admin;


use app\common\curd\Save;
use app\common\Enum;
use app\validate\AdminValidate;

class AdminSave extends Save
{
    //验证器
    protected $validate = [
        AdminValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['nickname', 'username', 'status', 'password', 'role_id', 'tel', 'email', 'mark', 'disabled_mark'];
}