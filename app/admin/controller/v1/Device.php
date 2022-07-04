<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\DeviceLogic;

class Device extends BaseController
{
    protected $name = '设备';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new DeviceLogic();
    }

    public function state($id = 0)
    {
        $result = $this->logic->useState($id);

        return $this->success($result);
    }
}
