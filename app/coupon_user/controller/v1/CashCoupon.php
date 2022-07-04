<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:16
 */

namespace app\coupon_user\controller\v1;


use app\coupon_user\controller\BaseController;
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