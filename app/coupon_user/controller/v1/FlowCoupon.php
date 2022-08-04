<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:16
 */

namespace app\coupon_user\controller\v1;


use app\coupon_user\controller\BaseController;
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
