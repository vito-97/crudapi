<?php
declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\CashCouponLogic;

class CashCoupon extends BaseController
{
    protected $name = '现金券';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new CashCouponLogic();
    }

}
