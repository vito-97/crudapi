<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\common\ErrorCode;
use app\common\Message;
use app\exception\MessageException;
use app\model\Device;
use app\service\DeviceControlService;
use app\validate\IDMustBeIntValidate;

class DeviceControlTestLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return Device::class;
    }

    public function getDeviceByID(int $id)
    {
        IDMustBeIntValidate::batchCheck(['id' => $id]);

        $device = $this->getByID($id, ['field' => ['id', 'device_no', 'imei', 'status']]);

        if (!$device) {
            throw new MessageException('没有相关设备');
        }

        if ($device->isDisabled()) {
            throw new MessageException(Message::STATUS_DISABLED, ErrorCode::STATUS_ERROR[0]);
        }

        return $device;
    }

    public function getDeviceByImei(string $imei, $check = false)
    {
        $device = $this->getOne(['where' => ['imei' => $imei], 'field' => ['id', 'device_no', 'imei', 'status'], 'cache' => 30]);

        if ($check && !$device) {
            throw new MessageException('设备未上线');
        }

        return $device;
    }

    public function clear($imei)
    {
        $this->service($imei)->init()->sleep()->clearFlow();

        return $this;
    }

    public function start($imei)
    {
        $this->service($imei)->start();

        return $this;
    }

    public function pause($imei)
    {
        $this->service($imei)->pause();

        return $this;
    }

    public function finish($imei)
    {
        $this->service($imei)->finish()->sleep()->init()->sleep()->clearFlow();;

        return $this;
    }

    public function flow($imei, $n)
    {
        $this->service($imei)->writeFlow((int)$n);

        return $this;
    }

    public function finishTimeout($imei, $n)
    {
        $this->service($imei)->finishTimeout((int)$n);
        $this->updateDevice($imei, ['finish_timeout' => $n]);
        return $this;
    }

    public function temperature($imei, $n)
    {
        $this->service($imei)->writeTemperature((int)$n);
        $this->updateDevice($imei, ['temperature' => $n]);
        return $this;
    }

    public function pulse($imei, $n)
    {
        $this->service($imei)->writePulse((int)$n);
        $this->updateDevice($imei, ['l_to_pulse' => $n]);
        return $this;
    }

    public function qrcode($imei)
    {
        $device = $this->getDeviceByImei($imei, true);

        $this->service($imei)->writeQrcodeUrl($device->qrcode_url);

        return $this;
    }

    public function deviceNo($imei)
    {
        $device = $this->getDeviceByImei($imei, true);

        $this->service($imei)->writetDeviceNo($device->device_no);

        return $this;
    }

    public function advertsLight($imei, $status)
    {
        $this->service($imei)->writeAdvertsLight($status);
        $this->updateDevice($imei, ['adverts_light' => $status ? 1 : 0]);
        return $this;
    }

    protected function updateDevice($imei, $data = [])
    {
        $device = $this->getDeviceByImei($imei);

        if ($device) {
            foreach ($data as $key => $value) {
                $device->$key = $value;
            }

            return $device->save();
        }

        return false;
    }

    public function service($imei)
    {
        static $service;

        if (!$service) {
            $service = new DeviceControlService();
        }

        $service->setImei($imei);

        return $service;
    }
}
