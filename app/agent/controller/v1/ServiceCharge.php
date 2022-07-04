<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:14
 */

namespace app\agent\controller\v1;

use app\agent\controller\BaseController;
use app\logic\ServiceChargeLogic;

class ServiceCharge extends BaseController
{
    protected $name = '服务费';

    protected $registerCurd = ['index', 'read'];

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new ServiceChargeLogic();
    }

    public function pay()
    {

    }
}