<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system_config_tab;

use app\common\curd\Save;
use app\common\Enum;
use app\validate\SystemConfigTabValidate;

class SystemConfigTabSave extends Save
{
    //验证器
    protected $validate = [
        SystemConfigTabValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['pid', 'name', 'status', 'icon', 'sort', 'key'];
}
