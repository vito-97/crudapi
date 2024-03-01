<?php
declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemConfigTabLogic;

class SystemConfigTab extends BaseController
{
    protected $name = '系统配置分类';

    protected $registerCrud = true;

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new SystemConfigTabLogic();
    }

}
