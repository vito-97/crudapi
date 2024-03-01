<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 14:04
 */

namespace app\command\async_task;

use think\facade\Cache;
use Workerman\Worker;

class Redis extends Base
{
    // 需要将default_socket_timeout设置为-1
    public function onStart(Worker $worker)
    {
        parent::onStart($worker);
        $cache = Cache::store('redis');
        $key   = 'async_task';

        while (true) {
            $data = $cache->brpop($key, 100);
            if ($data) {
                $this->dispatch->run($data[1]);
            }
        }
    }
}
