<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:16
 */

namespace app\agent\controller\v1;


use app\agent\controller\BaseController;
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
