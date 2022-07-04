<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:21
 */

namespace app\waterworks\controller\v1;


use app\waterworks\controller\BaseController;
use app\logic\ProductLogic;

class Product extends BaseController
{
    protected $name = '套餐';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new ProductLogic();
    }
}