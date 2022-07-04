<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:36
 */

namespace app\logic;


use app\model\DeviceTip;

class DeviceTipLogic extends BaseLogic
{
    protected function getModelName()
    {
        return DeviceTip::class;
    }
}