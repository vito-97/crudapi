<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:23
 */

namespace app\waterworks\controller\v1;


use app\waterworks\controller\BaseController;
use app\logic\DeviceRepairLogic;

class DeviceRepair extends BaseController
{
    protected $name = '设备报修';

    protected $registerCurd = true;

    protected $registerCurdDir = 'device';

    protected function initialize()
    {
        $this->logic = new DeviceRepairLogic();
    }
}