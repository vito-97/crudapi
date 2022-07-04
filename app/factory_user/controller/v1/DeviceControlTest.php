<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 10:24
 */

namespace app\factory_user\controller\v1;


use app\factory_user\controller\BaseController;
use app\logic\DeviceControlTestLogic;
use app\validate\DeviceControlTestValidate;

class DeviceControlTest extends BaseController
{
    protected $name = '设备控制测试';

    protected $validScene = 'imei';

    protected function initialize()
    {
        $this->logic = new DeviceControlTestLogic();
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

    protected function callControl($name, ...$args)
    {
        DeviceControlTestValidate::batchCheck($this->validScene);

        $imei = $this->request->param('imei');
        $this->logic->$name($imei, ...$args);

        return $this->success();
    }
}