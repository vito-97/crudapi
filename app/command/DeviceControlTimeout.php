<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/24
 * Time: 9:43
 */

namespace app\command;

use app\logic\DeviceControlLogic;
use app\model\DeviceControl as DeviceControlModel;
use app\model\User;
use app\service\user\UserService;
use think\cache\driver\Redis;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\facade\Cache;
use think\facade\Request;

class DeviceControlTimeout extends Command
{
    protected function configure()
    {
        $this->setName('device_control_timeout')
            ->setDescription('将太久没操作的设备结算');
    }

    protected function execute(Input $input, Output $output)
    {
        $deviceControlLogic = new DeviceControlLogic();
        //重试最大次数
        $max = 3;
        /**
         * @var Redis $cache
         */
        $cache = Cache::store('redis');

        $loop  = true;
        $model = $deviceControlLogic->getModel();
        while ($loop) {
            $waitTimeout  = time() - DeviceControlModel::WAIT_TIMEOUT;
            $pauseTimeout = time() - DeviceControlModel::PAUSE_TIMEOUT;
            $startTimeout = time() - DeviceControlModel::START_TIMEOUT;
            $waitMap      = [
                ['dc.state', '=', DeviceControlModel::STATE_WAIT],
                ['dc.create_time', '<=', $waitTimeout],
            ];
            $pauseMap     = [
                ['dc.state', '=', DeviceControlModel::STATE_PAUSE],
                ['dc.create_time', '<=', $pauseTimeout],
            ];
            $startMap     = [
                ['dc.state', '=', DeviceControlModel::STATE_START],
                ['dc.create_time', '<=', $startTimeout],
            ];
            //子查询获取每台设备最后一次的操作信息
            $orderSql = $model->order('id', 'DESC')->limit(10e10)->buildSql();
            $sql      = $model->queryWithTrashed()->table($orderSql . ' odc')->group('odc.device_id')->buildSql();

            $result = $deviceControlLogic->getModel()->queryWithTrashed()->table($sql . ' dc')->whereOr([$waitMap, $pauseMap, $startMap])->fetchSql(false)->select();

            foreach ($result as $item) {
                //设备存在则发送结算命令
                if ($item->device) {
                    $key     = 'wait_finish_device_' . $item->device_id;
                    $sendKey = 'send_finish_device_' . $item->device_id;
                    $device  = $item->device;

                 /*   if ($cache->has($sendKey)) {
                        $this->msg("[{$device->device_no}]已发送指令");
                        continue;
                    }*/

                    $this->msg("[{$device->device_no}]{$item->state_desc}超时，正在结算");
                    $user = User::withoutGlobalScope(['type'])->find($item->user_id);

                    if ($user) {
                        $num = $cache->get($key, 0);

                        if ($num < $max) {
                            try {
                                $cache->set($key, ++$num, 60);
                                $cache->set($sendKey, 1, 5);
                                $deviceControlLogic->setUser(new UserService($user, '', UserService::TYPE[$user->type] ?? ''));
                                Request::setUser(new UserService($user, '', UserService::TYPE[$user->type] ?? ''));
                                $deviceControlLogic->sendByDevice($device, DeviceControlModel::STATE_FINISH);
                            } catch (\Throwable $exception) {
                                $this->msg('发送MQTT错误：' . $exception->getMessage());
                            }

                            continue;
                        } else {
                            $this->msg("[{$device->device_no}]超出发送次数");
                        }
                    } else {
                        $this->msg('用户不存在');
                    }
                } else {
                    $this->msg('设备不存在');
                }

                $cache->delete($key);

                $this->finish($item, $deviceControlLogic);
            }

            if ($result->isEmpty()) {
//                $this->msg('暂无超时操作');
                sleep(2);
            } else {
                sleep(2);
            }
        }
    }

    protected function msg($string)
    {
        $date = date('Y-m-d H:i:s');
        dump('[' . $date . ']' . $string);

        return $this;
    }

    /**
     * @param $item
     * @param DeviceControlLogic $deviceControlLogic
     * @return $this
     */
    protected function finish($item, $deviceControlLogic)
    {
        //不存在则添加完成状态
        try {
            $status = $deviceControlLogic->addByDevice($item->device ?: $item->device_id, DeviceControlModel::STATE_FINISH, $item->user_id);

            if (!$status) {

                $this->msg('添加完成状态失败');
            }
        } catch (\Throwable $exception) {
            $this->msg('添加状态失败：' . $exception->getMessage());
        }

        return $this;
    }
}