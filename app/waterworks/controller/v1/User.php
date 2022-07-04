<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/12
 * Time: 10:43
 */

namespace app\waterworks\controller\v1;

use app\waterworks\controller\BaseController;
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