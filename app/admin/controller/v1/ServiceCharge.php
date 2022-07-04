<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/2
 * Time: 16:40
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\ServiceChargeLogic;

class ServiceCharge extends BaseController
{
    protected $name = '服务费';

    protected $registerCurd = true;

    protected $registerCurdDir = 'serviceCharge';

    protected function initialize()
    {
        $this->logic = new ServiceChargeLogic();
    }

}