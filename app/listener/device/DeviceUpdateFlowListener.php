<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/21
 * Time: 9:27
 */

namespace app\listener\device;

//结算
use app\common\EventName;
use app\logic\FlowLogic;
use app\model\Order;
use app\model\User;
use app\service\DeviceService;
use think\facade\Event;

class DeviceUpdateFlowListener extends DeviceHandleListener
{
    protected function run($detail)
    {
        $userID  = $this->control->user_id;
        $service = new DeviceService();
        //已使用的流量
        $realUseFlow = $useFlow = $service->userUseFLow($userID);
        //初始化流量数据
        $service->userFlowInit($userID);
        /**
         * @var $user User
         */
        $user = $this->control->user;

        if (!$useFlow && $user->type === User::NORMAL_TYPE && $user->flow) {
            $this->e('当前未使用流量，用户有流量，清空用户流量');
            $useFlow = 1;
        }

        //有使用流量
        if ($useFlow > 0) {
            $orders    = Order::where(['user_id' => $userID, 'status' => Order::STATUS_PAID, 'is_recharged' => Order::SWITCH_ON, 'is_clear' => Order::SWITCH_OFF])->order('id', 'desc')->limit(5)->select()->reverse();
            $orderFlow = 0;
            foreach ($orders as $order) {
                //判断订单非会员套餐则订单流量全部清空
                if ($order && (empty($order->product_snap['is_vip']))) {
                    $orderFlow       += $order->flow;
                    $order->is_clear = Order::SWITCH_ON;
                    $order->save();

                    //使用的流量小于订单总流量
                    if ($useFlow < $orderFlow) {
                        $useFlow = $orderFlow;
                        $this->e("充值套餐非会员套餐，清空套餐流量{$useFlow}L");

                        break;
                    }
                }
            }

            //获取最后一张订单
            $order = Order::where(['user_id' => $userID, 'status' => Order::STATUS_PAID, 'is_recharged' => Order::SWITCH_ON])->order('id', 'desc')->find();

            if ($order && $order->is_vip && $order->allow_refund && $order->flow > $useFlow) {
                $flow = $order->flow - $useFlow;
                //获取退款的金额
                $amount = round($flow / $order->flow * $order->pay_price, 2);

                if ($amount > 0) {
                    $params = [
                        'order'        => $order,
                        'refund_mark'  => "退还剩余流量{$flow}L的余额{$amount}元",
                        'refund_money' => $amount,
                    ];
                    //触发等待退款事件
                    Event::trigger(EventName::ORDER_WAIT_REFUND, $params);
                }
            }

            //用户使用总量
            if ($user->flow <= $useFlow) {
                //流量大于现有的流量
                $user->flow = 0;
            } else {
                // 普通用户只要有使用就清空流量
                if ($user->type == User::NORMAL_TYPE) {
                    $user->flow = 0;
                } else {
                    $user->flow = ['dec', $useFlow];
                }
            }

            $user->used_flow = ['inc', $realUseFlow];
            $user->save();

            //设备使用总量
            $this->device->used_flow = ['inc', $realUseFlow];
            $this->device->save();

            //设置流量使用记录
            $flowLogic = new FlowLogic();
            $flowLogic->add([
                'device_id' => $this->device->id,
                'user_id'   => $user->id,
                'flow'      => $realUseFlow,
                'site_id'   => $this->device->site_id,
            ]);
            $this->e("已使用流量{$useFlow}L");
        }

//        $this->e('正在清除结算余额');
//        $this->deviceControlService->clearFinishFlow();

//        return;
//        for($i=1;$i<=3;$i++){
//            $this->e('正在初始化余额和清空流量');
//        $this->deviceControlService->init()->sleep(0.1)->init()->sleep(0.1)->init()->sleep()->clearFlow()->sleep(0.1)->clearFinishFlow();
//        $this->e('已经初始化余额和清空流量');
        //设备可能接受不到清空流量指令
//        $this->deviceControlService->sleep(1.3)->clearFlow()->sleep(1.5)->clearFlow()->sleep(0.5)->clearFinishFlow();
//        }
    }
}
