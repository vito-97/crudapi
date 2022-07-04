<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:14
 */

namespace app\water_company\controller\v1;


use app\water_company\controller\BaseController;
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
}