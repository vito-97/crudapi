<?php
declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemCityLogic;

class SystemCity extends BaseController
{

    protected function initialize()
    {
        $this->logic = new SystemCityLogic();
    }

}
