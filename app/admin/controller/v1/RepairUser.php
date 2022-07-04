<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/16
 * Time: 16:21
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\RepairUserLogic;

class RepairUser extends BaseController
{
    protected $name = '运营商维护员';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new RepairUserLogic();
    }
}