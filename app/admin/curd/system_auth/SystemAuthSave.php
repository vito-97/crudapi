<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system_auth;

use app\admin\curd\Save;

class SystemAuthSave extends Save
{
    //验证器
    protected $validate = [];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];
}
