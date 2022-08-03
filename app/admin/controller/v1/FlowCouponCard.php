<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\FlowCouponCardLogic;

class FlowCouponCard extends BaseController
{
    protected $name = '流量券领取';

    protected $registerCurd = true;

    protected $registerCurdDir = 'flowCoupon';

    protected function initialize()
    {
        $this->logic = new FlowCouponCardLogic();
    }

}
