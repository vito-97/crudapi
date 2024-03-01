<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 14:04
 */

namespace app\command\async_task;

use app\service\RedisStoreService;
use think\Container;
use think\exception\ErrorException;
use think\facade\Cache;
use Workerman\Connection\TcpConnection;
use Workerman\Timer;
use Workerman\Worker;

class Base
{
    protected $address = '';

    protected $processCount = 1;

    /**
     * @var Dispatch
     */
    protected Dispatch $dispatch;

    public function __construct()
    {
        $this->dispatch = new Dispatch();
    }

    public function onStart(Worker $worker)
    {
        $this->pingRedis();
    }

    /**
     * 保持redis连接
     * @return void
     */
    protected function pingRedis()
    {
        RedisStoreService::setStore('redis2');
        // 每隔一段时间发送一个命令给 Redis 服务器
        Timer::add(30, function () {
            //缓存还未初始化的话就不进行检测
            if (!Container::getInstance()->has('think\Cache')) {
                return;
            }
            try {
                $ping = Cache::ping(); // 发送一个 ping 命令保持连接活跃
                if (!$ping) {
                    $this->reconnectRedis();
                }
            } catch (\Throwable $e) {
                dump('缓存ping出现错误：' . $e->getMessage());

                if ($e instanceof \RedisException || $e instanceof ErrorException) {
                    $this->reconnectRedis();
                }
            }
        });
    }

    public function onMessage(TcpConnection $connection, $data)
    {
    }

    /**
     * 获取连接地址
     * @return mixed|string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * 获取开启进程数
     * @return int|mixed
     */
    public function getProcessCount()
    {
        return $this->processCount;
    }

    /**
     * 输出日志
     * @param $msg
     * @return void
     */
    public function logger($msg)
    {
        $date = date('Y-m-d H:i:s');
        dump("[$date]$msg");
    }

    protected function reconnectRedis()
    {
        dump('重连redis');
        // 删除已经连接的redis缓存
        Container::getInstance()->delete('think\Cache');
    }
}
