<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:38
 */

namespace app\logic;


use app\model\Withdrawal;

class WithdrawalLogic extends UserLogic
{
    protected function getModelName()
    {
        return Withdrawal::class;
    }
}