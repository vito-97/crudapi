<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\WithdrawalLogic;

class Withdrawal extends BaseController
{
    protected $name = '提现';

    protected $registerCurd = ['index', 'change', 'read', 'delete'];

    protected $registerCurdDir = true;

    //废弃控制器
    const DISUSE = true;

    protected function initialize()
    {
        $this->logic = new WithdrawalLogic();
    }

}
