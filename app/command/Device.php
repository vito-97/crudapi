<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/28
 * Time: 14:16
 */

namespace app\command;

use app\common\Enum;
use app\job\DeviceServiceChargeJob;
use app\logic\ServiceChargeLogic;
use app\model\ServiceCharge;
use app\service\MqttService;
use app\service\RedisStoreService;
use think\console\Command;
use think\console\Input;
use think\console\input\Option;
use think\console\Output;
use think\facade\Queue;

class Device extends Command
{
    /**
     * @var MqttService
     */
    protected $mqtt;

    protected function configure()
    {
        $this->setName('device')
            ->addOption('mode', null, Option::VALUE_OPTIONAL, '推送生成服务费队列')
            ->setDescription('设备相关操作');
    }

    protected function execute(Input $input, Output $output)
    {
        try {
            if (!$input->hasOption('mode') || $input->getOption('mode') == 'sc') {
                $output->writeln('正在生成服务费队列');
                $this->createServiceCharge();
            } elseif ($input->getOption('mode') == 'pay_timeout') {
                $output->writeln('正在检测超时未缴费的设备');
                $this->waitPayTimeout();
            } else {
                $output->writeln('mode参数错误');
            }

        } catch (\Throwable $e) {
            dump('Error:' . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());
        }
    }

    /**
     * 推送生成服务费的队列
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function createServiceCharge()
    {
        $table = 'wait_create_service_charge_' . date('Y');
        $ids   = RedisStoreService::hkeys($table);

        $devices = \app\model\Device::field('id,imei,name,device_no')->where('id', 'NOT IN', $ids)->select();

        if ($devices->isEmpty()) {
            $this->output->writeln('没有需要生成的设备');
        }

        foreach ($devices as $device) {
            $has = RedisStoreService::tableGet($table, $device->id);

            if (!$has) {
                $this->output->writeln("[{$device['device_no']}]正在推送服务费生成队列");
                RedisStoreService::tableSet($table, $device->id, 1);
                $data  = $device->toArray();
                $time  = strtotime(date('Y-12-01 00:00:00'));
                $delay = $time - time();

                if ($delay <= 0) {
                    $delay = 2;
                }

                Queue::later($delay, DeviceServiceChargeJob::class, $data, Enum::JOB_CREATE_SERVICE_CHARGE);
            } else {
                $this->output->writeln("[{$device['device_no']}]已推送服务费生成队列");
            }
        }
    }

    /**
     * 服务费缴费超时
     */
    protected function waitPayTimeout()
    {
        $logic = new ServiceChargeLogic();

        $deviceID = $logic->where('is_pay', ServiceCharge::SWITCH_OFF)->whereTime('expire_time', '<=', time())->group('device_id')->column('device_id');

        if ($deviceID) {

            $excludeID = [1];

            $deviceID = array_diff($deviceID, $excludeID);

            $ids = join(',', $deviceID);
            $this->output->writeln("[${ids}]未交服务费");

            if (!env('IS_DEV')) {
                \app\model\Device::update(['disabled' => \app\model\Device::SWITCH_ON], [['id', 'IN', $deviceID]]);
                $this->output->writeln('已禁用超时缴纳服务费的设备');
            } else {
                $this->output->writeln('本地不予禁用');
            }

        } else {
            $this->output->writeln('未检测到超时缴费的设备');
        }
    }

}
