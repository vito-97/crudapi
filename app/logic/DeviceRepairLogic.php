<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\logic;

use app\model\DeviceRepair;

class DeviceRepairLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return DeviceRepair::class;
    }

}
