<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\agent\controller\v1;

use app\agent\controller\BaseController;
use app\logic\CashCouponCardLogic;

class CashCouponCard extends BaseController
{
    protected $name = '现金券领取';

    protected $registerCurd = true;

    protected $registerCurdDir = 'cashCoupon';

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new CashCouponCardLogic();
    }

}
