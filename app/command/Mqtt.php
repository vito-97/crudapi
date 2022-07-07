<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/28
 * Time: 15:41
 */

namespace app\command;

use app\common\Enum;
use app\common\ErrorCode;
use app\common\EventName;
use app\logic\DeviceLogic;
use app\model\Device;
use app\model\DeviceControl;
use app\service\DeviceControlService;
use app\service\DeviceService;
use app\service\MqttService;
use app\service\user\UserService;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Container;
use think\facade\Env;
use think\facade\Event;
use think\facade\Request;

class Mqtt extends Command
{
    /**
     * @var MqttService
     */
    protected $mqtt;

    protected function configure()
    {
        $this->setName('mqtt')
            ->setDescription('start mqtt');
    }

    protected function execute(Input $input, Output $output)
    {
        try {
            $this->mqtt = new MqttService();
            $this->subscribe();
        } catch (\Throwable $e) {
            dump('Error:' . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());
        }
    }

    /**
     * 订阅
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    protected function subscribe()
    {
        $this->output->writeln('开始订阅');
        $this->mqtt->setClientID(Enum::MQTT_SUBSCRIBE_CLIENT_ID);
        $this->mqtt->subscribe(Enum::DEVICE_SUBSCRIBE_TOPIC, function ($topic, $message) {
            try {

                [, $imei] = explode('/', $topic);
                $imei = trim($imei);

                $hex      = str2hex($message);
                $service  = new DeviceService();
                $deviceNo = $service->deviceNo($imei);

                if ($deviceNo) {
                    $deviceID = $service->deviceID($deviceNo);
                    $control  = $service->deviceLastControl($deviceNo);

                    $params = [
                        'service'   => $service,
                        'imei'      => $imei,
                        'device_no' => $deviceNo,
                        'device_id' => $deviceID,
                        'control'   => $control,
                        'msg'       => $message,
                        'hex'       => $hex,
                        'mqtt'      => $this->mqtt,
                    ];

                    if (Env::get('APP_DEBUG')) {
//                        $date = date('Y-m-d H:i:s');

//                        dump("[{$date}]Mqtt:{$deviceNo}:{$hex}");
                    }

                    Event::trigger(EventName::MQTT_SUBSCRIBE_MSG, $params);

                } else {
                    if (strpos($hex, Enum::DEVICE_ONLINE_CODE) === 0) {
                        //允许上线的白名单
                        $white = [];

                        if (is_dev() && !in_array($imei, $white)) {
                            $this->output->writeln('本地测试不进行上线，需要上线请添加到白名单 IMEI:' . $imei);
                            return;
                        }

                        $type = get_device_online_type($hex);

                        $logic = new DeviceLogic();

                        $device = $logic->online($imei, $type);

                        if ($device->onlineSetting) {
                            $logic->setting($device);//设置
                        }

                        $this->output->writeln('设备上线成功 IMEI:' . $imei);

//                        $this->output->writeln('设备上线失败：' . $exception->getMessage());
                    } else {
                        $this->output->writeln("未知IMEI号：{$imei}");
                        $this->output->writeln('消息：' . $hex);
                    }
                }

            } catch (\Throwable $e) {
                dump('Error:' . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());

                //设备状态错误
                if ($e->getCode() === ErrorCode::STATUS_ERROR[0]) {

                    if ($control && $control->user) {
                        $device = new Device([
                            'id'        => $deviceID,
                            'device_no' => $deviceNo,
                            'imei'      => $imei,
                            'status'    => 1,
                        ]);
                        $user   = $control->user;
                        Request::setUser(new UserService($user, '', UserService::TYPE[$user->type] ?? ''));
                        $logic = new DeviceLogic();
                        $logic->addDeviceControl($device, DeviceControl::STATE_FINISH);
                    }
                    /**
                     * @var DeviceControlService $deviceControlService
                     */
                    $deviceControlService = Container::getInstance()->invokeClass(DeviceControlService::class);
                    $deviceControlService->setImei($imei)->finish()->sleep()->init()->sleep()->clearFlow();
                }
            }
        });

        //客户端轮询以处理传入消息和重发队列
        $this->mqtt->loop();
    }
}