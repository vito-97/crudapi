<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 15:08
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\DashboardLogic;

class Dashboard extends BaseController
{
    protected $name = '仪表盘';

    protected $methodName = [
        'index' => '%s',
    ];

    protected function initialize()
    {
        $this->logic = new DashboardLogic();
    }

    public function index()
    {
        $response = $this->logic->admin();

        return success($response);
    }
}