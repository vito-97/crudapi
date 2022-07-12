<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Save;
use app\common\Enum;
use app\common\EventName;
use app\model\Device;
use app\validate\DeviceValidate;
use think\facade\Event;

class DeviceSave extends Save
{
    //验证器
    protected $validate = [
        DeviceValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['used_flow'];
    //关联写入
//    protected $together = ['tip' => Device::TIP_FIELD];
    //排除
    protected $withoutField = true;

    protected function saveMiddleware($next, $params)
    {
        if (empty($params['site_id'])) {
            $params['site_id'] = $this->getUserRole()->site_id;
        }

        $response = $next($params);

        if ($response) {
            Event::trigger(EventName::DEVICE_SAVE, ['new' => $response, 'is_new' => true]);
        }

        return $response;
    }
}