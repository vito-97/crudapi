<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\DeviceAppVersionLogic;

class DeviceAppVersion extends BaseController
{
    protected $name = '设备APP版本';

    protected $registerCurd = true;

    protected $registerCurdDir = 'device';

    const DISUSE = true;

    protected function initialize()
    {
        $this->logic = new DeviceAppVersionLogic();
    }

}
