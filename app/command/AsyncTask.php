<?php
declare (strict_types = 1);

namespace app\command;

use app\command\async_task\Dispatch;
use app\command\async_task\Redis;
use app\command\async_task\Tcp;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;
use think\Container;
use think\helper\Str;
use Workerman\Worker;

class AsyncTask extends Command
{
    /**
     * @var Tcp|Redis
     */
    protected $driver;

    protected function configure()
    {
        // 指令配置
        $this->setName('async_task')
            ->addArgument('status', Argument::REQUIRED, 'start/stop/reload/status/connections')
            ->addOption('driver', null, Option::VALUE_OPTIONAL, '使用驱动类型')
            ->addOption('d', null, Option::VALUE_NONE, 'daemon（守护进程）方式启动')
            ->setDescription('开启/关闭/重启 异步执行设备指令');
    }

    protected function init(Input $input, Output $output)
    {
        global $argv;

        $argv[1] = $input->getArgument('status') ?: 'start';
        if ($input->hasOption('d')) {
            $argv[2] = '-d';
            unset($argv[3]);
        } else {
            unset($argv[2]);
        }

        define('MQTT_KEEP_ALIVE_INTERVAL', 65535);

        $default = $this->input->getOption('driver') ?: config('async_task.default');

        $this->logger("使用异步任务驱动：{$default}");

        $class = __NAMESPACE__ . '\\async_task\\' . Str::studly($default);

        $this->driver = Container::getInstance()->make($class);

        $dispatch = new Dispatch();
        $dispatch->clearCache();

        // 删除已经连接的redis缓存
        Container::getInstance()->delete('think\Cache');
    }

    protected function execute(Input $input, Output $output)
    {
        $this->init($input, $output);
        $driver = $this->driver;
        //创建定时器任务
        $task                = new Worker($driver->getAddress());
        $task->count         = $driver->getProcessCount();
        $task->onWorkerStart = [$driver, 'onStart'];
        $task->onMessage     = [$driver, 'onMessage'];
        Worker::$stdoutFile  = '/root/async_task_log.txt';

        $task->runAll();
    }

    /**
     * 输出日志
     * @param $msg
     * @return void
     */
    protected function logger($msg)
    {
        $date = date('Y-m-d H:i:s');
        $this->output->writeln("[$date]$msg");
    }
}
