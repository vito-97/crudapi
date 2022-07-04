<?php
declare (strict_types = 1);

namespace app\logic;

use app\model\SystemConfig;


class SystemConfigLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return SystemConfig::class;
    }

}
