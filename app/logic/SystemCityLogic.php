<?php
declare (strict_types = 1);

namespace app\logic;

use app\model\SystemCity;


class SystemCityLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return SystemCity::class;
    }

}
