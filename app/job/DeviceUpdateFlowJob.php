<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/9/3
 * Time: 15:06
 */

namespace app\job;

use app\common\EventName;
use app\logic\DeviceControlLogic;
use app\logic\DeviceLogic;
use think\facade\Event;
use think\queue\Job;

class DeviceUpdateFlowJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        ['device_id' => $deviceID, 'user_id' => $userID] = $data;

        $deviceLogic  = new DeviceLogic();
        $controlLogic = new DeviceControlLogic();

        $device  = $deviceLogic->getByID($deviceID);
        $control = $controlLogic->getModel()->where(['device_id' => $deviceID, 'user_id' => $userID])->order('id', 'desc')->find();

        $params = ['device' => $device, 'control' => $control];
        Event::trigger(EventName::DEVICE_UPDATE_FLOW, $params);

        return true;
    }
}
