<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:23
 */

namespace app\repair_user\controller\v1;


use app\logic\DeviceRepairLogic;
use app\repair_user\controller\BaseController;

class DeviceRepair extends BaseController
{
    protected $name = '设备报修';

    protected $registerCurd = ['index','change','save','update','edit','read'];

    protected $registerCurdDir = 'device';

    protected function initialize()
    {
        $this->logic = new DeviceRepairLogic();
    }
}