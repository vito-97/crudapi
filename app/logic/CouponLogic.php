<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:34
 */

namespace app\logic;


use app\model\Coupon;

class CouponLogic extends BaseLogic
{
    protected function getModelName()
    {
        return Coupon::class;
    }

    protected function getCouponByID($id){

    }
}