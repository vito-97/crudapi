<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:12
 */

namespace app\listener\device;

use app\model\Device;

class DeviceFinishControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
//        $userID  = $this->control->user_id;
//        $service = new DeviceService();
//        for ($i=1;$i<=2;$i++){
        $type = $this->device->type;
        $this->e('正在停止');
        if ($this->switch) {
            $msg = '';
            if ($type == Device::EASY_TYPE) {
                $tip = $this->device->tip;
                $msg = $tip['finish_tip'] ?? '';
            }
            $this->deviceControlService->close($type, $msg);

            //简易主板 查询状态
            if ($type == Device::EASY_TYPE) {
                $this->deviceControlService->setQueue(2)->queryEasyStatus();
            }

        } else {
            $this->deviceControlService->finish();
        }
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
