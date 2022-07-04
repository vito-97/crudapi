<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:37
 */

namespace app\logic;


use app\model\SystemLog;

class SystemLogLogic extends BaseLogic
{
    protected function getModelName()
    {
        return SystemLog::class;
    }
}