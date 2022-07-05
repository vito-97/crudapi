<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\waterworks\controller\v1;

use app\logic\AdvertsLogic;
use app\waterworks\controller\BaseController;

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
