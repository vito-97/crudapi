<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 14:04
 */

namespace app\command\async_task;

use think\Container;
use think\facade\Config;
use think\queue\Listener;
use Workerman\Worker;

class Queue extends Base
{
    protected Listener $listener;

    public function onStart(Worker $worker)
    {
        parent::onStart($worker);
        $connection = Config::get('queue.default', 'redis');

        $queue = 'async_task';

        $this->listener = Container::getInstance()->make(Listener::class);

        $this->listener->setOutputHandler(function ($type, $line) {
            $this->logger($line);
        });

        $this->listener->listen($connection, $queue);
    }
}
