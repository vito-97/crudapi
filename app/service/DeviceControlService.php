<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/12
 * Time: 17:54
 */

namespace app\service;


use app\common\Enum;
use app\job\DeviceControlJob;
use PhpMqtt\Client\MqttClient;
use think\facade\App;
use think\facade\Log;
use think\facade\Queue;

class DeviceControlService
{
    const ONE_HEAD = '0106';//单个写入头
    const MORE_HEAD = '0110';//多个写入头;

    const ADDRESS = [
        'set_flow'            => '0000000204', //初始流量 单位升
        'start'               => '00060001',//启动按键
        'pause'               => '00070001',//暂停按键
        'finish'              => '00080001',//结算按键
//        'open'                => '00500001',//开机
//        'close'               => '00500000',//关机
        'open1'               => '010600140001080E',//强制开启
        'close1'              => '010600140000C9CE',//强制结束
        'open2'               => '01050000FF8C3A',
        'close2'              => '0105000000CDCA',
        'set_pulse'           => '00c800',//设置脉冲
        'set_temperature'     => '020200',//设置温度
        'set_qrcode_url'      => '0500000D1A',//设置二维码地址
        'set_device_no'       => '0600000306',//设置设备号
        'clear_status'        => '01050FA200006F3C',//清除状态
        'init'                => '01060009000059C8',//清除状态
        'clear_flow'          => '010600020000280a',//清除使用流量
        'adverts_light_open'  => '00cc0001',
        'adverts_light_close' => '00cc0000',
        'finish_timeout'      => '00D3',
    ];

    protected static $lastControlTime = 0;

    //队列延时时间发送
    protected static $laterTime = 0;
    //递增延时时间
    protected $laterIncTime = 3;

    protected $imei;

    protected $deviceNo;

    protected $timeout = 2;

    //是否用队列控制
    protected $queue = false;

    protected $logger = false;

    public function __construct($imei = null)
    {
        $this->mqtt = new MqttService();
        $this->mqtt->setClientID(Enum::MQTT_SEND_CLIENT_ID);
        $this->setImei($imei);
        $this->logger = env('MQTT_DEBUG');
//        $this->mqtt->loop();
    }

    /**
     * 设置是否使用队列
     * @param $status
     * @return $this
     */
    public function setQueue($status)
    {
        $this->queue = $status;

        return $this;
    }

    /**
     * 发送数据
     * @param $data
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function send($data, $func = 'hex2str')
    {
        if ($func && function_exists($func)) {
            $data = $func($data);
        }

        $this->mqtt->publish($this->getSendTopic(), $data, MqttClient::QOS_EXACTLY_ONCE);
    }

    public function init()
    {
        $address = self::ADDRESS['init'];

        $this->writeLog('初始化', $address);

        return $this->writePush($address, false);
    }

    public function open($type = 1)
    {
        $address = self::ADDRESS['open' . $type];

        $this->writeLog('强制开启', $address);

        return $this->writePush($address, false);
    }

    public function close($type = 1)
    {
        $address = self::ADDRESS['close' . $type];

        $this->writeLog('强制结束', $address);

        return $this->writePush($address, false);
    }

    /**
     * 广告灯开关
     * @param $status
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writeAdvertsLight($status)
    {
        $key     = 'adverts_light_' . ($status ? 'open' : 'close');
        $address = self::ONE_HEAD . self::ADDRESS[$key];

        $this->writeLog(($status ? '开' : '关') . '广告灯', $address);

        return $this->writePush($address);
    }

    public function clearFlow()
    {
        $address = self::ADDRESS['clear_flow'];

        $this->writeLog('清空流量', $address);

        return $this->writePush($address, false);
    }

    /**
     * 清除状态
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function clearStatus()
    {
        $address = self::ADDRESS['clear_status'];

        $this->writeLog('清除状态', $address);

        return $this->writePush($address);
    }

    /**
     * 启动
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function start()
    {
        $address = self::ONE_HEAD . self::ADDRESS['start'];

        $this->writeLog('启动设备', $address);

        return $this->writePush($address);
    }

    /**
     * 暂停
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function pause()
    {
        $address = self::ONE_HEAD . self::ADDRESS['pause'];

        $this->writeLog('暂停设备', $address);

        return $this->writePush($address);
    }

    /**
     * 结算
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function finish()
    {
        $address = self::ONE_HEAD . self::ADDRESS['finish'];

        $this->writeLog('停止设备', $address);

        return $this->writePush($address);
    }

    /**
     * 设置IMEI
     * @param $value
     * @return $this
     */
    public function setImei($value)
    {
        if ($value) {
            $this->imei = $value;
            /**
             * @var DeviceService $deviceService
             */
            $deviceService  = App::getInstance()->make(DeviceService::class);
            $this->deviceNo = $deviceService->deviceNo($value);
        }

        return $this;
    }

    /**
     * 设置自动结算定时器的定时时间
     * @param $n
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function finishTimeout($n)
    {
        //传入的数字需要*10
        $hex = strtoupper(str_pad(dec2hex($n * 10), 4, '0', STR_PAD_LEFT));

        $address = self::ONE_HEAD . self::ADDRESS['finish_timeout'] . $hex;

        return $this->writePush($address);
    }

    /**
     * 初始化下发余额
     * @param $value
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writeFlow($value)
    {
        $n       = dec2hex($value);
        $len     = 8;
        $hex     = strtoupper(str_pad($n, $len, '0', STR_PAD_LEFT));
        $n       = substr($hex, 4) . substr($hex, 0, 4);
        $address = self::MORE_HEAD . self::ADDRESS['set_flow'] . $n;

        $this->writeLog('下发流量' . $value . 'L', $address);

        return $this->writePush($address);
    }

    /**
     * 写入设备号
     * @param $value
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writetDeviceNo($value)
    {
        $address = self::MORE_HEAD . self::ADDRESS['set_device_no'] . str2hex($value);

        $this->writeLog('写入设备号', $address);

        return $this->writePush($address);
    }

    /**
     * 写入二维码链接
     * @param $value
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writeQrcodeUrl($value)
    {
        $address = self::MORE_HEAD . self::ADDRESS['set_qrcode_url'] . str2hex($value);

        $this->writeLog('写入二维码', $address);

        return $this->writePush($address);
    }

    /**
     * 写入温度
     * @param $value
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writeTemperature(int $value)
    {
        $address = self::ONE_HEAD . self::ADDRESS['set_temperature'] . dec2hex($value);

        $this->writeLog('设置温度' . $value . '度', $address);

        return $this->writePush($address);
    }

    /**
     * 写入脉冲参数
     * @param $value
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    public function writePulse(int $value)
    {
        $address = self::ONE_HEAD . self::ADDRESS['set_pulse'] . dec2hex($value);

        $this->writeLog('脉冲参数' . $value, $address);

        return $this->writePush($address);
    }

    /**
     * 延时执行
     * @param int|float $time
     * @return $this
     */
    public function sleep($time = 0)
    {
        if (!$this->queue) {
            $time = $time ? $time : $this->timeout;
            usleep($time * 1000000);
        }

        return $this;
    }

    /**
     * 获取发送主题
     * @return string
     */
    protected function getSendTopic()
    {
        return sprintf(Enum::DEVICE_SEND_TOPIC, $this->imei);
    }

    /**
     * 写推送
     * @param $address
     * @param bool $crc
     * @return $this
     * @throws \PhpMqtt\Client\Exceptions\DataTransferException
     * @throws \PhpMqtt\Client\Exceptions\RepositoryException
     */
    protected function writePush($address, $crc = true)
    {
        $data = $address . ($crc ? crc16($address) : '');
        //010600D309607E4B  240秒

        if ($this->queue) {
            $this->queuePush($data);
        } else {
            $this->send($data);
        }

        return $this;
    }

    protected function queuePush($data)
    {
        $msg = ['imei' => $this->imei, 'msg' => $data];

        $n = get_float_time() - self::$lastControlTime;

        if ($n >= self::$laterTime) {
//            dump('now');
            Queue::push(DeviceControlJob::class, $msg, Enum::JOB_DEVICE_CONTROL);
            self::$laterTime = $this->laterIncTime;
        } else {
            $later = (int)ceil(self::$laterTime - $n);
//            dump('later');
//            dump($later);
            Queue::later($later, DeviceControlJob::class, $msg, Enum::JOB_DEVICE_CONTROL_LATER);
            self::$laterTime += $this->laterIncTime;
        }

        self::$lastControlTime = get_float_time();

        return $this;
    }

    public function setMqttClientID($id)
    {
        $this->mqtt->setClientID($id);

        return $this;
    }

    protected function writeLog($msg, $hex)
    {
        if ($this->logger) {
            Log::record('{imei}:{device_no}:{msg} 指令：{hex}', 'mqtt', ['imei' => $this->imei, 'device_no' => $this->deviceNo, 'msg' => $msg, 'hex' => $hex]);
        }

        return $this;
    }
}