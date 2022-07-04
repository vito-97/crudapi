<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemConfigLogic;

class SystemConfig extends BaseController
{
    protected $name = '系统配置';

    protected $registerCurd = true;

    protected $registerCurdDir = 'systemConfig';

    protected function initialize()
    {
        $this->logic = new SystemConfigLogic();
    }

}
