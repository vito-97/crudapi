<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_config;

use app\admin\crud\Save;
use app\common\Enum;
use app\validate\SystemConfigValidate;

class SystemConfigSave extends Save
{
    //验证器
    protected $validate = [
        SystemConfigValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];
}
