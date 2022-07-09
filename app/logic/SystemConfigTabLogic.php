<?php
declare (strict_types=1);

namespace app\logic;

use app\model\SystemConfigTab;


class SystemConfigTabLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return SystemConfigTab::class;
    }
}
