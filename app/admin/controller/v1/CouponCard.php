<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\CouponCardLogic;

class CouponCard extends BaseController
{
    protected $name = '优惠券领取';

    protected $registerCurd = true;

    protected $registerCurdDir = 'coupon';

    protected function initialize()
    {
        $this->logic = new CouponCardLogic();
    }

}
