<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:12
 */

namespace app\listener\device;

use app\model\User;
use app\service\DeviceService;

class DeviceFinishControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
//        $userID  = $this->control->user_id;
//        $service = new DeviceService();
//        for ($i=1;$i<=2;$i++){
        $this->e('正在停止');
        $this->deviceControlService->finish();
        $this->e('已经停止');
//        }

//        //已使用的流量
//        $useFlow = $service->userUseFLow($userID);
//        //初始化流量数据
//        $service->userFlowInit($userID);
//
//        $this->deviceControlService->finish()->sleep()->init();
//
//        //有使用流量
//        if ($useFlow > 0) {
//            /**
//             * @var $user User
//             */
//            $user = $this->control->user;
//
//            $user->flow = ['dec', $useFlow];
//            $user->save();
//        }
    }
}