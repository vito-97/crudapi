<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:14
 */

namespace app\repair_user\controller\v1;


use app\common\ErrorCode;
use app\common\Message;
use app\exception\MessageException;
use app\logic\DeviceLogic;
use app\repair_user\controller\BaseController;
use app\service\DeviceControlService;
use app\validate\IDMustBeIntValidate;

class Device extends BaseController
{
    protected $name = '设备';

    protected $registerCurd = ['index','change','save','update','edit','read'];

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new DeviceLogic();
    }

    public function flow($id = '')
    {
        IDMustBeIntValidate::batchCheck();
        $device = $this->getDevice($id);
        $control = $this->control($device);
    }

    public function start($id = '')
    {
        IDMustBeIntValidate::batchCheck();

    }

    public function pause($id = '')
    {
        IDMustBeIntValidate::batchCheck();

    }

    public function finish($id = '')
    {
        IDMustBeIntValidate::batchCheck();

    }

    public function clear($id = '')
    {
        IDMustBeIntValidate::batchCheck();

    }

    protected function getDevice($id = 0)
    {
        $device = $this->logic->getByID($id, ['field' => ['id', 'device_no', 'imei', 'status']]);

        if (!$device) {
            throw new MessageException('没有相关设备');
        }

        if ($device->isDisabled()) {
            throw new MessageException(Message::STATUS_DISABLED, ErrorCode::STATUS_ERROR[0]);
        }

        return $device;
    }

    protected function control($device)
    {
        static $service;

        if (!$service) {
            $service = new DeviceControlService();
        }

        $service->setImei($device->imei);

        return $service;
    }
}