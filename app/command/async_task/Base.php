<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 14:04
 */

namespace app\command\async_task;

use Workerman\Connection\TcpConnection;
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
}
