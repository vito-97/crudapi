<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/2
 * Time: 16:43
 */

namespace app\logic;


use app\model\ServiceCharge;

class ServiceChargeLogic extends BaseLogic
{
    protected function getModelName()
    {
        return ServiceCharge::class;
    }

}