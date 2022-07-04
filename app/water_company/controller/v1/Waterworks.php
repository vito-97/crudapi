<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/29
 * Time: 11:34
 */

namespace app\water_company\controller\v1;

use app\logic\WaterworksLogic;
use app\water_company\controller\BaseController;

class Waterworks extends BaseController
{
    protected $name = '水厂';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new WaterworksLogic();
    }
}