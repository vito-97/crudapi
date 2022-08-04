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

    protected $methodName = [
        'state' => '获取设备使用状态',
    ];

    const NOT_NEED_LOGGER = ['state'];

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
