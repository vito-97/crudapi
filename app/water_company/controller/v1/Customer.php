<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:28
 */

namespace app\water_company\controller\v1;

use app\logic\CustomerLogic;
use app\water_company\controller\BaseController;

class Customer extends BaseController
{
    protected $name = '取水客戶';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new CustomerLogic();
    }
}