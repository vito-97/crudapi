<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/20
 * Time: 14:53
 */

namespace app\job;

use app\logic\DeviceLogic;
use app\model\Device;
use app\model\Member;
use app\service\DeviceService;
use app\service\user\UserService;
use think\facade\Request;
use think\queue\Job;

class DeviceTimeoutJob extends BaseJob
{
    protected function execute($data, Job $job): bool
    {
        if ($data['user_id'] && $data['device_no']) {
            $user = Member::field('id,username,flow,expire_time,type')->find($data['user_id']);
            if ($user) {
                Request::setUser(new UserService($user->toArray(), '', UserService::TYPE[$user->type] ?? ''));

                $service = new DeviceService();
                $control = $service->deviceLastControl($data['device_no']);

                //最后一次操作为启动并且为当前用户的操作并且当前用户的加注时间已到期
                if ($control->isStartState() && $user->id == $control->user_id) {
                    if ($user->expire_time <= time()) {
                        try {
                            $logic = new DeviceLogic();
                            $logic->finish($data['device_no'], false, true);
                        } catch (\Throwable $exception) {
                            dump($exception->getMessage());
                        }
                    } else {
                        $n = $user->expire_time - time();
                        if ($n <= 10) {
                            $this->delay = $n;
                            return false;
                        }
                    }
                }
            }
        }

        return true;
    }
}
