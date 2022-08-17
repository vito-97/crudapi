<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/13
 * Time: 16:31
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\AgentLogic;

class Agent extends BaseController
{
    protected $name = '运营商';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new AgentLogic();
    }

}
