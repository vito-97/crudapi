<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\AllInPayLogic;

class AllInPay extends BaseController
{
    protected $name = '通联支付';

    protected $registerCurd = true;

    protected $registerCurdDir = 'pay';

    protected function initialize()
    {
        $this->logic = new AllInPayLogic();
    }

}
