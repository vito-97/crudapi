<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 14:50
 */

namespace app\service;


use PhpMqtt\Client\ConnectionSettings;
use PhpMqtt\Client\MqttClient;
use think\facade\App;
use think\facade\Env;
use think\facade\Request;
use think\helper\Str;

/**
 * Class MqttService
 * @package app\service
 * @mixin MqttClient
 */
class MqttService
{
    protected $config = [
        'server'              => '175.178.63.7',
        'port'                => 1883,
        'client_id'           => 'server',
        'username'            => 'water',
        'password'            => 'a123456.',
        'clean_session'       => false,
        'keep_alive_interval' => 60,
    ];

    //别名
    protected static $alias = [];

    /**
     * @var ConnectionSettings
     */
    protected $setting;

    /**
     * @var MqttClient
     */
//    protected static $mqtt = [];
    protected static $mqtt;

    public function __construct()
    {
        $this->config = array_merge($this->config, config('mqtt'));
    }

    /**
     * 设置mqtt的参数
     * @return ConnectionSettings
     */
    protected function getSetting()
    {
        if (!$this->setting) {
            $connectionSettings = new ConnectionSettings();
            $connectionSettings = $connectionSettings
                ->setUsername($this->config['username'])
                ->setPassword($this->config['password'])
                ->setKeepAliveInterval($this->config['keep_alive_interval'])
                // Last Will 设置
                ->setLastWillTopic('emqx/test/last-will')
                ->setLastWillMessage('server disconnect')
                ->setLastWillQualityOfService(1);

            $this->setting = $connectionSettings;
        }

        return $this->setting;
    }

    /**
     * 获取MQTT客户端
     * @param string $clientID
     * @return MqttClient
     * @throws \PhpMqtt\Client\Exceptions\ConfigurationInvalidException
     * @throws \PhpMqtt\Client\Exceptions\ConnectingToBrokerFailedException
     * @throws \PhpMqtt\Client\Exceptions\ProtocolNotSupportedException
     */
//    public function mqtt($clientID = null)
//    {
//        $this->setClientID($clientID);
//        $alias = self::$alias[$this->config['client_id']];
//
//        if (empty(self::$mqtt[$alias])) {
//            if (Request::isCli()) {
//                dump(date('Y-m-d H:i:s') . ' Mqtt Client ID:' . $alias);
//            }
////            self::$mqtt[$clientID] = App::make(MqttClient::class, [$this->config['server'], $this->config['port'], $clientID]);
//            self::$mqtt[$alias] = new MqttClient($this->config['server'], $this->config['port'], $this->config['client_id']);
//
//            if (!self::$mqtt[$alias]->isConnected()) {
//                self::$mqtt[$alias]->connect($this->getSetting(), $this->config['clean_session']);
//            }
//        }
//
//        return self::$mqtt[$alias];
//    }

    public function mqtt($clientID = null)
    {
        $this->setClientID($clientID);
        $alias = self::$alias[$this->config['client_id']];

        if (empty(self::$mqtt)) {
            if (Request::isCli()) {
                dump(date('Y-m-d H:i:s') . ' Mqtt Client ID:' . $alias);
            }
//            self::$mqtt[$clientID] = App::make(MqttClient::class, [$this->config['server'], $this->config['port'], $clientID]);
            self::$mqtt = new MqttClient($this->config['server'], $this->config['port'], $this->config['client_id']);

            if (!self::$mqtt->isConnected()) {
                self::$mqtt->connect($this->getSetting(), $this->config['clean_session']);
            }
        }

        return self::$mqtt;
    }


    //常驻
    public function loop()
    {
        $this->mqtt()->loop(true);
        $this->mqtt()->disconnect();

        return $this;
    }

    /**
     * 通过主题获取设备ID
     * @param $string
     * @return mixed|string
     */
    public function getDeviceIDByTopic($string)
    {
        $array = explode('/', $string);

        return array_pop($array);
    }

    /**
     * 配置
     * @param $name
     * @param null $value
     * @return $this
     */
    public function setConfig($name, $value = null)
    {
        if (is_array($name)) {
            $this->config = array_merge($this->config, $name);
        } else {
            $this->config[$name] = $value;
        }

        return $this;
    }

    /**
     * 设置客户端ID
     * @param $id
     * @return $this
     */
    public function setClientID($id = null)
    {
        if ($id) {
            $clientID = $id . (Env::get('is_dev') ? '_dev' : '') . (App::getInstance()->request->isCli() ? '_cli' : '');
            $key      = array_search($clientID, self::$alias);

            if ($key) {
                $alias = $key;
            } else {
                $alias = $clientID . '_' . Str::random();
            }

            $this->config['client_id'] = $alias;
            self::$alias[$alias]       = $clientID;
        }
        return $this;
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->mqtt(), $name], $arguments);
    }
}