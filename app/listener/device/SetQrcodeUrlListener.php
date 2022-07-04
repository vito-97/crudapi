<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 16:31
 */

namespace app\listener\device;


class SetQrcodeUrlListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $this->e('正在设置二维码');
        $this->deviceControlService->writeQrcodeUrl($this->device->qrcode_url)->sleep();
    }
}