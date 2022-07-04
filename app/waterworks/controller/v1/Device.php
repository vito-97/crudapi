<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:14
 */

namespace app\waterworks\controller\v1;


use app\waterworks\controller\BaseController;
use app\logic\DeviceLogic;
use app\validate\IDMustBeIntArrayValidate;

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