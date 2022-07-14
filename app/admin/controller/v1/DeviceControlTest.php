<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/17
 * Time: 10:24
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\DeviceControlTestLogic;
use app\validate\DeviceControlTestValidate;

class DeviceControlTest extends BaseController
{
    protected $name = '设备控制测试';

    protected $validScene = 'imei';

    protected $methodName = [
        'clear'         => '清除状态',
        'flow'          => '下发余额',
        'temperature'   => '设置防冻温度',
        'pulse'         => '设置脉冲参数',
        'start'         => '启动设备',
        'pause'         => '暂停设备',
        'finish'        => '停止设备',
        'qrcode'        => '设置二维码',
        'deviceNo'      => '设置设备编号',
        'finishTimeout' => '设置暂停自动结算时间',
        'advertsLight'  => '开/关 广告灯',
    ];

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

    public function finishTimeout()
    {
        $this->validScene = 'num';
        return $this->callControl(__FUNCTION__, $this->request->param('num'));
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