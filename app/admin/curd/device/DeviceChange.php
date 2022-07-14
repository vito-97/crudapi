<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Change;
use app\common\EventName;
use think\facade\Event;
use think\Model;

class DeviceChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'used_global_product', 'adverts_light', 'disabled'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        $data     = $model->toArray();
        $response = $next($model, $params);

        if ($response) {
            Event::trigger(EventName::DEVICE_SAVE, ['new' => $response, 'old' => $data]);
        }


        return $response;
    }
}