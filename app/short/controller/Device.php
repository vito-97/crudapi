<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/3
 * Time: 17:42
 */

namespace app\short\controller;

use app\BaseController;
use app\common\Enum;
use app\exception\DataNotFoundException;
use app\logic\DeviceLogic;

class Device extends BaseController
{
    public function index($deviceNo = '')
    {
        $logic = new DeviceLogic();

        try {
            $device = $logic->getDevice($deviceNo);
        } catch (DataNotFoundException $e) {
            return '错误的设备号' . $deviceNo;
        } catch (\Throwable $e) {
            return $e->getMessage();
        }

        $url = web('client_host') . ($device->site_id == Enum::SITE_TWO ? 'pages/water/fetcher' : '') . '?device_no=' . $deviceNo;
        return redirect($url);
    }
}
