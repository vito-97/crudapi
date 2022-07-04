<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/14
 * Time: 9:42
 */

namespace app\listener\device;


use app\service\DeviceControlService;

class DeviceSaveListener
{
    public function handle($params)
    {
        $old   = $params['old'] ?? '';
        $new   = $params['new'] ?? '';
        $isNew = $params['is_new'] ?? false;

        $imei = $old['imei'] ?? $new['imei'] ?? '';
        if ($new && $imei) {
            $deviceControlService = new DeviceControlService($imei);
            $deviceControlService->setQueue(true);

            //设置温度
            if (!empty($new['temperature']) && (!$old || empty($old['temperature']) || $new['temperature'] != $old['temperature'])) {
                $deviceControlService->writeTemperature($new['temperature']);
            }
            //设置广告灯
            if (isset($new['adverts_light']) && (!$old || !isset($old['adverts_light']) || $new['adverts_light'] != $old['adverts_light'])) {
                $deviceControlService->writeAdvertsLight($new['adverts_light']);
            }

            //设置脉冲
            if (!empty($new['l_to_pulse']) && (!$old || empty($old['l_to_pulse']) || $new['l_to_pulse'] != $old['l_to_pulse'])) {
                $deviceControlService->writePulse($new['l_to_pulse']);
            }

            if ($isNew) {
                //设置设备号
                if (!empty($new['device_no'])) {
                    $deviceControlService->writetDeviceNo($new['device_no']);
                }

                //设置二维码
                if ($new['qrcode_url']) {
                    $deviceControlService->writeQrcodeUrl($new['qrcode_url']);
                }
            }
        }
    }
}