<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:28
 */

namespace app\customer\controller\v1;


use app\customer\controller\BaseController;
use app\logic\RepairUserLogic;

class WaterFetcher extends BaseController
{
    protected $name = '取水员';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new RepairUserLogic();
    }
}