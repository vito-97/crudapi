<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\user_oauth;

use app\common\curd\Delete;

class UserOauthDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}