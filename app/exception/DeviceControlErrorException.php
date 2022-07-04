<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/11
 * Time: 16:11
 */

namespace app\exception;


use app\common\ErrorCode;

class DeviceControlErrorException extends BaseException
{
    protected $code = ErrorCode::DEVICE_CONTROL_ERROR[0];
    protected $message = ErrorCode::DEVICE_CONTROL_ERROR[1];
}