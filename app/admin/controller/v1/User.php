<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\UserLogic;

class User extends BaseController
{
    protected $name = '用户';

    protected $registerCrud = true;

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new UserLogic();
    }

}
