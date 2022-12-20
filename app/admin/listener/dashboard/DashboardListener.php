<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\admin\listener\dashboard;

use app\common\ArrayObject;
use app\common\Enum;
use app\logic\CustomerLogic;
use app\logic\DeviceLogic;
use app\logic\FlowLogic;
use app\logic\OrderLogic;
use app\logic\UserLogic;
use app\logic\WaterCompanyLogic;
use app\logic\WaterFetcherLogic;
use app\logic\WaterworksLogic;
use app\model\Device;
use app\model\Order;
use app\model\User;
use think\facade\Request;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $this->data($params);
    }

    protected function data($params)
    {
        $user   = new UserLogic();

        $params->merge([
            'count_user'                 => $user->count(),
        ]);
    }
}