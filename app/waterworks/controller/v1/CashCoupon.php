<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:16
 */

namespace app\waterworks\controller\v1;


use app\waterworks\controller\BaseController;
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