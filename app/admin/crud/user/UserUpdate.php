<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\user;

use app\admin\crud\Update;
use app\common\Enum;
use app\validate\UserValidate;

class UserUpdate extends Update
{
    //验证器
    protected $validate = [
        UserValidate::class => Enum::VALID_UPDATE_SCENE
    ];
    //允许新增的数据字段
    protected $field = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
