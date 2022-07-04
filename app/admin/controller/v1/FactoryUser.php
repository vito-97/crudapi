<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\FactoryUserLogic;

class FactoryUser extends BaseController
{
    protected $name = '出厂设置员';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new FactoryUserLogic();
    }
}
