<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:14
 */

namespace app\factory_user\controller\v1;


use app\factory_user\controller\BaseController;
use app\logic\DeviceLogic;

class Device extends BaseController
{
    protected $name = '设备';

    protected $registerCurd = ['index','change','save','update','edit','read'];

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new DeviceLogic();
    }
}