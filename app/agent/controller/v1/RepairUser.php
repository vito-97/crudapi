<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:28
 */

namespace app\agent\controller\v1;


use app\agent\controller\BaseController;
use app\logic\RepairUserLogic;

class RepairUser extends BaseController
{
    protected $name = '运维员';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new RepairUserLogic();
    }
}