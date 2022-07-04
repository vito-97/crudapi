<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/9
 * Time: 9:58
 */

namespace app\waterworks\controller\v1;


use app\waterworks\controller\BaseController;
use app\logic\DashboardLogic;

class Dashboard extends BaseController
{
    protected $name = '仪表盘';

    protected function initialize()
    {
        $this->logic = new DashboardLogic();
    }

    public function index()
    {
        $response = $this->logic->waterworks();

        return success($response);
    }
}