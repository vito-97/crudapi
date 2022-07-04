<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\CouponCardLogic;

class CashCouponCard extends BaseController
{
    protected $name = '现金券领取';

    protected $registerCurd = true;

    protected $registerCurdDir = 'cashCoupon';

    protected function initialize()
    {
        $this->logic = new CouponCardLogic();
    }

}
