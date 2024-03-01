<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemLogLogic;

class SystemLog extends BaseController
{
    protected $name = '系统日志';

    protected $registerCrud = ['index', 'read', 'delete'];

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new SystemLogLogic();
    }

}
