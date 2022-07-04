<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/10
 * Time: 15:42
 */

namespace app\listener\pay;


use app\common\Enum;
use app\model\Device;
use app\model\Order;
use app\model\ServiceCharge;

class PaySuccessServiceChargeListener
{
    public function handle($detail)
    {
        ['order' => $order] = $detail;

        //服务费缴费
        if ($order->type === Order::SERVICE_CHARGE_TYPE && $order->extend_data) {
            $ids = $order->extend_data;

            $result = ServiceCharge::where('id', 'IN', $ids)->select();

            $deviceIds = array_unique($result->column('device_id'));

            //更新服务费数据
            ServiceCharge::update(
                [
                    'is_pay'   => Enum::SWITCH_ON,
                    'order_id' => $order->id,
                    'pay_time' => $order->pay_time,
                ],
                [['id', 'IN', $ids]]
            );

            if (!$deviceIds) {
                return;
            }

            //获取还未支付服务费的设备
            $waitPayServiceCharge = array_unique(ServiceCharge::where(['is_pay' => Enum::SWITCH_OFF, 'agent_id' => $order->agent_id])->column('device_id'));

            //需要解禁的设备ID
            $updateDeviceIds = array_diff($deviceIds, $waitPayServiceCharge);

            if ($updateDeviceIds) {
                //将禁用的设备更新为启用
                Device::update(
                    ['disabled' => Enum::SWITCH_OFF],
                    [
                        ['id', 'IN', $updateDeviceIds],
                        ['disabled', '=', Enum::SWITCH_ON],
                    ]
                );
            }
        }
    }
}