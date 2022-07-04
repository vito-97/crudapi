<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\user;

use app\water_company\curd\Update;
use app\common\Enum;
use app\validate\UserValidate;

class UserUpdate extends Update
{
    //验证器
    protected $validate = [
        UserValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform'];
    protected $withoutField = true;
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}