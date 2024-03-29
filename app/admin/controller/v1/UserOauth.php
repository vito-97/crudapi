<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/14
 * Time: 10:03
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\UserLogic;

class UserOauth extends BaseController
{
    protected $name = '第三方授权';

    protected $registerCrud = ['index', 'delete', 'read', 'change'];

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new UserLogic();
    }
}
