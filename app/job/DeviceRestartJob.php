<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/1
 * Time: 9:24
 */

namespace app\job;

use app\logic\DeviceLogic;
use app\model\Device;
use app\model\DeviceControl;
use app\model\Member;
use app\service\DeviceService;
use think\queue\Job;

class DeviceRestartJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        ['imei' => $imei, 'device_no' => $device_no, 'device_id' => $device_id, 'user_id' => $user_id, 'state' => $state] = $data;

        $user          = Member::find($user_id);
        $deviceService = new DeviceService();
        $last          = $deviceService->deviceLastControl($device_no);
        if ($user && $user->flow && (!$last || ($last->user_id == $user_id && !in_array($last->state, [DeviceControl::STATE_WAIT, DeviceControl::STATE_START])))) {
            $device = Device::where('status', Device::STATUS_ON)->find($device_id);
            if ($state == DeviceControl::STATE_WAIT) {
                $date = date('Y-m-d H:i:s');
                dump("[$date][$imei]:正在重新下发流量");
                //将机器设置为待启动
                $logic = new DeviceLogic();
                $logic->wait($device, DeviceControl::STATE_WAIT);
            }
        }

        return true;
    }
}