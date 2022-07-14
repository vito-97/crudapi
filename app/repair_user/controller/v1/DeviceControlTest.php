<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 10:24
 */

namespace app\repair_user\controller\v1;

use app\exception\MessageException;
use app\repair_user\controller\BaseController;
use app\logic\DeviceControlTestLogic;
use app\validate\DeviceControlTestValidate;

class DeviceControlTest extends BaseController
{
    protected $name = '设备控制测试';

    protected $validScene = 'imei';

    protected function initialize()
    {
        $this->logic = new DeviceControlTestLogic();
        \app\model\Device::setScope(['agent' => $this->user->getUserInfo()->agent_id]);
    }

    public function clear()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function flow()
    {
        $this->validScene = 'num';
        return $this->callControl(__FUNCTION__, $this->request->param('num'));
    }

    public function temperature()
    {
        $this->validScene = 'num';
        return $this->callControl(__FUNCTION__, $this->request->param('num'));
    }

    public function pulse()
    {
        $this->validScene = 'num';
        return $this->callControl(__FUNCTION__, $this->request->param('num'));
    }

    public function start()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function pause()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function finish()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function qrcode()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function deviceNo()
    {
        return $this->callControl(__FUNCTION__);
    }

    public function advertsLight()
    {
        $this->validScene = 'status';
        return $this->callControl(__FUNCTION__, $this->request->param('status'));
    }

    public function finishTimeout()
    {
        $this->validScene = 'num';
        return $this->callControl(__FUNCTION__, $this->request->param('num'));
    }

    protected function callControl($name, ...$args)
    {
        DeviceControlTestValidate::batchCheck($this->validScene);

        $imei = $this->request->param('imei');

        $device = \app\model\Device::where('imei', $imei)->field('id,name,device_no,status,disabled,agent_id')->find();

        if ($device) {
            if ($device->agent_id != $this->user->getUserInfo()->agent_id) {
                throw new MessageException('没有相关设备');
            }

            if ($device->isDisabled()) {
                throw new MessageException('设备已被禁用');
            }
        }

        $this->logic->$name($imei, ...$args);

        return $this->success();
    }
}