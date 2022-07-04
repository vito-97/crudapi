<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/10
 * Time: 17:57
 */

namespace app\service;


use app\logic\DeviceControlLogic;
use app\logic\DeviceLogic;
use app\model\DeviceControl;

class DeviceService
{
    /**
     * 获取设备的ID
     * @param $deviceNo
     * @param int $id
     * @return $this|int|mixed
     */
    public function deviceID($deviceNo, $id = null)
    {
        $table = __FUNCTION__;
        $key   = $deviceNo;

        $id = RedisStoreService::tableRemember($table, $key, $id, function () use ($deviceNo) {
            $logic = new DeviceLogic();

            $id = $logic->getModel()->where('device_no', $deviceNo)->cache(60)->value('id') ?: 0;

            return $id;
        },false);

        return $id;
    }

    /**
     * 通过imei获取设备号
     * @param $imei
     * @param null $value
     * @return int|mixed|null
     */
    public function deviceNo($imei, $value = null)
    {
        $table = __FUNCTION__;
        $key   = $imei;

        $value = RedisStoreService::tableRemember($table, $key, $value, function () use ($imei) {
            $logic = new DeviceLogic();

            $value = $logic->getModel()->where('imei', $imei)->cache(60)->value('device_no') ?: 0;

            return $value;
        },false);

        return $value;
    }

    /**
     * 获取设备最后一次操作的用户ID
     * @param $deviceNo
     * @param null $userID
     * @return int|mixed
     */
    public function deviceLastControlUserID($deviceNo, $userID = null)
    {
        $table    = __FUNCTION__;
        $deviceID = is_integer($deviceNo) ? $deviceNo : $this->deviceID($deviceNo);
        $key      = $deviceID;

        $userID = RedisStoreService::tableRemember($table, $key, $userID, function () use ($deviceNo, $deviceID) {
            $logic = new DeviceControlLogic();

            $userID = $logic->getModel()->where('device_id', $deviceID)->order('id', 'desc')->value('id') ?: 0;

            return $userID;
        });


        return $userID;
    }

    /**
     * 设备最后一次操作的记录
     * @param $deviceNo
     * @param null $data
     * @return DeviceControl|int|mixed|null
     */
    public function deviceLastControl($deviceNo, $data = null)
    {
        $table    = __FUNCTION__;
        $deviceID = is_integer($deviceNo) ? $deviceNo : $this->deviceID($deviceNo);
        $key      = $deviceID;

        $data = RedisStoreService::tableRemember($table, $key, $data, function () use ($deviceID, $deviceNo) {
            $logic = new DeviceControlLogic();

            $detail = $logic->getModel()->getDeviceLastControl($deviceID);

            if ($detail) {
                $detail = $detail->toArray();
            }

            return $detail;
        },false);

        if ($data) {
            if (isset($data['create_time']) && is_string($data['create_time'])) {
                $data['create_time'] = strtotime($data['create_time']);
            }
            if (empty($data['create_time'])) {
                $data['create_time'] = time();
            }
            $data = new DeviceControl($data);
        }

        return $data;
    }

    /**
     * 通过用户获取最后一次操作的记录
     * @param $userID
     * @param null $data
     * @return DeviceControl|int|mixed|null
     */
    public function deviceLastControlByUser($userID, $data = null)
    {
        $table = __FUNCTION__;
        $key   = $userID;

        $data = RedisStoreService::tableRemember($table, $key, $data, function () use ($userID) {
            $logic = new DeviceControlLogic();

            $detail = $logic->getModel()->getUserLastControl($userID);

            if ($detail) {
                $detail = $detail->toArray();
            }

            return $detail;
        });

        if ($data) {
            if (isset($data['create_time']) && is_string($data['create_time'])) {
                $data['create_time'] = strtotime($data['create_time']);
            }
            if (empty($data['create_time'])) {
                $data['create_time'] = time();
            }
            $data = new DeviceControl($data);
        }

        return $data;
    }

    /**
     * 设备有用户想操作的
     * @param $deviceNo
     * @param null $userID
     * @return int|mixed|null
     */
    public function deviceWantControlUserID($deviceNo, $userID = null)
    {
        $table    = __FUNCTION__;
        $deviceID = is_integer($deviceNo) ? $deviceNo : $this->deviceID($deviceNo);
        $key      = $deviceID;

        $userID = RedisStoreService::tableRemember($table, $key, $userID);


        return $userID;
    }

    /**
     * 用户启动时的流量
     * @param $userID
     * @param null $data
     * @return int|mixed|null
     */
    public function userStartFlow($userID, $data = null)
    {
        $table = __FUNCTION__;
        $key   = $userID;

        $data = RedisStoreService::tableRemember($table, $key, $data);

        return $data;
    }

    /**
     * 用户启动时的流量
     * @param $userID
     * @param null $data
     * @return int|mixed|null
     */
    public function userStopFlow($userID, $data = null)
    {
        $table = __FUNCTION__;
        $key   = $userID;

        $data = RedisStoreService::tableRemember($table, $key, $data);

        return $data;
    }

    /**
     * 获取用户使用的流量
     * @param $userID
     * @return int|mixed|null
     */
    public function userUseFLow($userID)
    {
        $start = $this->userStartFlow($userID);
        $stop  = $this->userStopFlow($userID);

        if (!$start || !is_numeric($stop)) {
            return 0;
        }

        return $start - $stop;
    }

    /**
     * 记录用户的流量初始化
     * @param $userID
     * @return $this
     */
    public function userFlowInit($userID)
    {
        $this->userStartFlow($userID, false);
        $this->userStopFlow($userID, false);

        return $this;
    }
}