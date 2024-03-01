<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:58
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\AdvertsLogic;

class Adverts extends BaseController
{
    protected $name = '广告';

    protected $registerCrud = true;

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new AdvertsLogic();
    }
}
