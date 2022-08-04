<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\coupon_user\controller\v1;

use app\coupon_user\controller\BaseController;
use app\logic\FlowCouponCardLogic;

class FlowCouponCard extends BaseController
{
    protected $name = '流量券领取';

    protected $registerCurd = ['read', 'index', 'delete'];

    protected $registerCurdDir = 'flowCoupon';

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new FlowCouponCardLogic();
    }

}
