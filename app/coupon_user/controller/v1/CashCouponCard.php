<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\coupon_user\controller\v1;

use app\coupon_user\controller\BaseController;
use app\logic\CashCouponCardLogic;

class CashCouponCard extends BaseController
{
    protected $name = '现金券领取';

    protected $registerCurd = ['read', 'index', 'delete'];

    protected $registerCurdDir = 'cashCoupon';

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new CashCouponCardLogic();
    }

}
