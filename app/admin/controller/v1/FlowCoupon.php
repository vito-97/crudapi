<?php
declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\FlowCouponLogic;

class FlowCoupon extends BaseController
{
    protected $name = '流量券';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new FlowCouponLogic();
    }

}
