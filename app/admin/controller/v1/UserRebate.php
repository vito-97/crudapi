<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\UserRebateLogic;

class UserRebate extends BaseController
{
    protected $name = '返利';

    protected $registerCurd = ['index', 'read', 'change'];

    protected $registerCurdDir = 'user';

    protected function initialize()
    {
        $this->logic = new UserRebateLogic();
    }

}
