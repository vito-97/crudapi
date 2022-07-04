<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/12
 * Time: 10:43
 */

namespace app\water_company\controller\v1;

use app\water_company\controller\BaseController;
use app\logic\UserLogic;

class User extends BaseController
{
    protected $name = '用户';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new UserLogic();
    }

    protected $methodName = [];
}