<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/14
 * Time: 14:49
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\DeviceControlLogic;

class DeviceControl extends BaseController
{
    protected $name = '设备操作记录';

    protected $registerCurd = true;

    protected $registerCurdDir = 'device';

    protected function initialize()
    {
        $this->logic = new DeviceControlLogic();
    }
}