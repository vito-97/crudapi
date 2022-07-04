<?php
declare (strict_types = 1);

namespace app\logic;

use app\model\AllInPay;


class AllInPayLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return AllInPay::class;
    }

}
