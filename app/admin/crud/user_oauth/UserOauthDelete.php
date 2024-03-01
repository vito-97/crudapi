<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\user_oauth;

use app\admin\crud\Delete;

class UserOauthDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
