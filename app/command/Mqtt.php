<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/28
 * Time: 15:41
 */

namespace app\command;

use app\common\Enum;
use app\service\MqttService;
use think\console\Command;
use think\console\Input;
use think\console\Output;

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
        $this->mqtt->subscribe(Enum::MQTT_SUBSCRIBE_TOPIC, function ($topic, $message) {
            try {
                //todo
            } catch (\Throwable $e) {
                dump('Error:' . $e->getMessage() . ' in ' . $e->getFile() . ' on line ' . $e->getLine());
            }
        });

        //客户端轮询以处理传入消息和重发队列
        $this->mqtt->loop();
    }
}
