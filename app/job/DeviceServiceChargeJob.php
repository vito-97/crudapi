<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/26
 * Time: 17:42
 */

namespace app\job;

use app\logic\ServiceChargeLogic;
use app\logic\SystemConfigLogic;
use app\model\Device;
use think\queue\Job;

//设备服务费生成
class DeviceServiceChargeJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        $logic = new SystemConfigLogic();

        $amount    = $logic->getConfigs('service_charge_amount', 0);
        $expireDay = $logic->getConfigs('service_charge_pay_day', 31);

        if ($amount) {
            //获取今年有几天
            $days = date('z', mktime(23, 59, 59, 12, 31, date('Y'))) + 1;

            //获取一天的费用
            $dayAmount = $amount / $days;

            $device = Device::find($data['id']);

            if ($device) {
                $time     = $device->getData('create_time');
                $startDay = date('z', $time);

                $useDay = $days - $startDay + 1;

                $money = round($useDay * $dayAmount, 2);

                $serviceChargeLogic = new ServiceChargeLogic();

                //判断今年的服务费是否有生成
                $has = $serviceChargeLogic->getModel()->where([
                    'device_id' => $device->id,
                    'agent_id'  => $device->agent_id,
                    'amount'    => $money,
                ])->whereTime('create_time', 'year')->find();

                if (!$has) {
                    $status = $serviceChargeLogic->getModel()->add([
                        'title'       => date('Y') . '年服务费',
                        'device_id'   => $device->id,
                        'agent_id'    => $device->agent_id,
                        'amount'      => $money,
                        'time'        => time(),
                        'expire_time' => strtotime("+{$expireDay} day"),
                    ]);

                    if (!$status) {
                        return false;
                    }
                }
            }
        }

        return true;
    }
}
