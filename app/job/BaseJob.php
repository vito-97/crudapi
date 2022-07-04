<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/17
 * Time: 9:36
 */

namespace app\job;

use think\facade\Cache;
use think\queue\Job;
use think\facade\Log;

/**
 * Class Queue 队列消费基础类
 * @package app\queue
 */
abstract class BaseJob
{
    protected $delay = 2;

    //重试次数
    protected $attempts = 3;

    /**
     * @describe:fire是消息队列默认调用的方法
     * @param \think\queue\Job $job
     * @param $message
     */
    public function fire(Job $job, $data)
    {
        if (empty($data)) {
            Log::error(sprintf('[%s][%s] 队列无消息', __CLASS__, __FUNCTION__));
            return;
        }

        $jobId = $job->getJobId(); // 队列的数据库id或者redis key
        // $jobClassName = $job->getName(); // 队列对象类
        // $queueName = $job->getQueue(); // 队列名称

        // 如果已经执行中或者执行完成就不再执行了
        if (!$this->checkJob($jobId, $data)) {
            $job->delete();
            Cache::store('redis')->delete($jobId);
            return;
        }

        // 执行业务处理
        if ($this->execute($data, $job)) {
            Log::record(sprintf('[%s][%s] 队列执行成功', __CLASS__, __FUNCTION__));
            $job->delete(); // 任务执行成功后删除
            Cache::store('redis')->delete($jobId); // 删除redis中的缓存
        } else {
            // 检查任务重试次数
            if ($job->attempts() > $this->attempts) {
                Log::error(sprintf('[%s][%s] 队列执行重试次数超过3次，执行失败', __CLASS__, __FUNCTION__));
                // 第1种处理方式：重新发布任务,该任务延迟10秒后再执行；也可以不指定秒数立即执行
                //$job->release(10);
                // 第2种处理方式：原任务的基础上1分钟执行一次并增加尝试次数
                //$job->failed();
                // 第3种处理方式：删除任务
                $job->delete(); // 任务执行后删除
                Cache::store('redis')->delete($jobId); // 删除redis中的缓存
            }

            $job->release($this->delay);
        }
    }

    /**
     * 消息在到达消费者时可能已经不需要执行了
     * @param string $jobId
     * @param $message
     * @return bool 任务执行的结果
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    protected function checkJob(string $jobId, $message): bool
    {
        // 查询redis
        $data = Cache::store('redis')->get($jobId);
        if (!empty($data)) {
            return false;
        }
        Cache::store('redis')->set($jobId, $message);
        return true;
    }

    /**
     * @describe: 根据消息中的数据进行实际的业务处理
     * @param $data 数据
     * @return bool 返回结果
     */
    abstract protected function execute($data, Job $job): bool;
}