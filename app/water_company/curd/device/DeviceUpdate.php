<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\device;

use app\water_company\curd\Update;
use app\common\Enum;
use app\common\EventName;
use app\validate\DeviceValidate;
use think\facade\Event;
use think\Model;

class DeviceUpdate extends Update
{
    //验证器
    protected $validate = [
        DeviceValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['id', 'agent_id', 'device_no', 'used_flow', 'disabled'];
    protected $withoutField = true;
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        $data     = $model->toArray();
        $response = $next($model, $params);

        if ($response) {
            Event::trigger(EventName::DEVICE_SAVE, ['new' => $params, 'old' => $data]);
        }

        return $response;
    }
}