<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\agent\controller\v1;

use app\agent\controller\BaseController;
use app\logic\AdvertsLogic;
use app\logic\DeviceLogic;

class Adverts extends BaseController
{
    protected $name = '广告';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new AdvertsLogic();
    }

}
