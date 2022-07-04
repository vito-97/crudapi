<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Save;
use app\common\Enum;
use app\exception\MessageException;
use app\validate\DeviceValidate;
use think\facade\Request;

class DeviceSave extends Save
{
    //验证器
    protected $validate = [
        DeviceValidate::class => 'bind',
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];

    //不使用全局查询
    protected $withoutGlobalScope = true;

    protected function saveMiddleware($next, $params)
    {

        $imei  = $this->request->param('imei');
        $model = $this->getLogic()->getModel();

        $detail = $model->where('imei', $imei)->find();

        if (!$detail) {
            throw new MessageException('查询不到设备');
        }

        $uid = Request::getUser()->getUserInfo()->agent_id;

        if ($detail->agent_id && $detail->agent_id != $uid) {
            throw new MessageException('设备已被其他用户绑定');
        }

        if ($detail->agent_id && $detail->agent_id == $uid) {
            throw new MessageException('设备已绑定');
        }

        $detail->agent_id = $uid;

        return $next($detail);
    }
}