<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\logic;

use app\model\Customer;

class CustomerLogic extends UserLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return Customer::class;
    }

}
