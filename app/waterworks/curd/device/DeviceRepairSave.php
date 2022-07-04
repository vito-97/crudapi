<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Save;
use app\common\Enum;
use app\validate\DeviceRepairValidate;

class DeviceRepairSave extends Save
{
    //验证器
    protected $validate = [
        DeviceRepairValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['content' => ''];
    //允许新增的数据字段
    protected $field = ['title', 'content', 'device_id', 'status', 'user_id', 'repair_user_id'];

    protected function saveMiddleware($next, $params)
    {
        $params['agent_id'] = $this->user->uid();
        return $next($params);
    }
}