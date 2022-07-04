<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/11
 * Time: 9:57
 */

namespace app\listener\device;


use app\model\Device;
use app\service\DeviceService;

class DeviceControlListener extends DeviceHandleListener
{
    public function run($params)
    {
        $device  = $this->device;
        $control = $this->control;
        $service = new DeviceService();

        if ($control) {
            $data = $control->visible(['user_id', 'state', 'device_id', 'create_time'])->toArray();
//            $data['create_time'] = $control->getData('create_time');
            $this->e("用户ID:{$control->user_id}正在控制");
            //设备最后一次操作的用户ID
            $service->deviceLastControlUserID($device->device_no, $control->user_id);
            //设备最后一次操作的记录
            $service->deviceLastControl($device->device_no, $data);
            //用户最后一次操作设备的记录
            $service->deviceLastControlByUser($control->user_id, $data);

            //更新设备状态
            $state = $data['state'];

            if (!in_array($state, [Device::WAIT_STATE, Device::START_STATE, Device::PAUSE_STATE])) {
                $state = Device::FREE_STATE;
            }

            if (isset($device->state) && $device->state != $state) {
                $device->state = $data['state'];
                $device->save();
            }
        }

    }
}