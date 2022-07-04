<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/14
 * Time: 14:59
 */

namespace app\admin\curd\device;


trait DeviceControlTrait
{
    /**
     * 设置关联中间件
     * @param $next
     * @return mixed
     */
    protected function setWithMiddleware($next)
    {
        if (empty($this->with['device'])) {
            $this->with['device'] = function ($query) {
                $query->withField(['id', 'name', 'device_no', 'price','used_flow']);
            };
        }
        return $next();
    }
}