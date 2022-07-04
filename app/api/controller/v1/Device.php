<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/8
 * Time: 10:38
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\logic\DeviceLogic;
use app\validate\DeviceValidate;

class Device extends BaseController
{
    const NOT_NEED_LOGIN = ['detail', 'setting'];

    protected $name = '设备';

    protected $methodName = [
        'detail'  => '详情',
        'wait'    => '待启动',
        'start'   => '启动设备',
        'pause'   => '暂停设备',
        'finish'  => '停止设备',
        'setting' => '设置设备',
        'useing'  => '获取设备状态',
    ];

    protected function initialize()
    {
        $this->logic = new DeviceLogic();
    }

    public function detail()
    {
        $detail = $this->logic->getDevice($this->request->param('device_no'))->scene('api');

        $response = [
            'detail' => $detail,
        ];

        return success($response, '获取设备信息成功');
    }

    //开始加水
    public function wait()
    {
        $response = $this->logic->wait($this->request->param('device_no'));

        return success([], '等待加水');
    }

    //开始加水
    public function start()
    {
        $response = $this->logic->start($this->request->param('device_no'), true);

        return success([], '开始加水');
    }

    //暂停加水
    public function pause()
    {
        $response = $this->logic->pause($this->request->param('device_no'), true);

        return success([], '暂停加水');
    }

    //加水完成
    public function finish()
    {
        $response = $this->logic->finish($this->request->param('device_no'), true);

        return success([], '加水完成');
    }

    public function setting()
    {
        $response = $this->logic->setting($this->request->param('device_no'));

        return success([], '设置成功');
    }

    public function useing()
    {
        $response = $this->logic->useing($this->request->param('device_no'));

        return success($response, '获取状态成功');
    }
}