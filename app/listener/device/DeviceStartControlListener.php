<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 17:11
 */

namespace app\listener\device;


use app\model\Device;

class DeviceStartControlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $this->e('正在启动');
        $this->start();
        $this->e('已经启动');
    }

    public function start()
    {
        if ($this->switch) {
            $type = $this->device->type;
            $msg  = '';
            if ($type == Device::EASY_TYPE) {
                $tip = $this->device->tip;
                $msg = $tip['start_tip'] ?? '';
            }
            $this->deviceControlService->open($type, $msg);

            //简易主板 查询状态
            if ($type == Device::EASY_TYPE) {
                $this->deviceControlService->setQueue(2)->queryEasyStatus();
            }

        } else {
            $this->deviceControlService->start();
        }
    }
}
