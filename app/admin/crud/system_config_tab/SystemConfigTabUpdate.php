<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_config_tab;

use app\admin\crud\Update;
use app\common\Enum;
use app\validate\SystemConfigTabValidate;

class SystemConfigTabUpdate extends Update
{
    //验证器
    protected $validate = [
        SystemConfigTabValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['pid', 'name', 'status', 'icon', 'sort', 'key'];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
