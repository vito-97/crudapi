<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\logic;

use app\model\FactoryUser;

class FactoryUserLogic extends UserLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return FactoryUser::class;
    }

}
