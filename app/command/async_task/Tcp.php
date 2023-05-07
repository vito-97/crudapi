<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 14:03
 */

namespace app\command\async_task;

use Workerman\Connection\TcpConnection;

class Tcp extends Base
{
    protected $address = 'text://127.0.0.1:2346';
    protected $processCount = 100;

    public function onMessage(TcpConnection $connection, $data)
    {
        $connection->send('ok');
        $connection->close();
        $this->dispatch->run($data);
    }
}
