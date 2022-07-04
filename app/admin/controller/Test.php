<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/2
 * Time: 16:45
 */

namespace app\admin\controller;


use app\logic\DeviceAppVersionLogic;
use think\facade\View;

class Test extends BaseController
{
    public function index(){
        return $this->xss();
    }

    protected function xss(){
        $logic = new DeviceAppVersionLogic();

        $detail = $logic->getByID($this->request->param('id',12));

        return $detail->content;
    }
}