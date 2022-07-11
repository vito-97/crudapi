<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/11
 * Time: 15:07
 */

namespace app\exception;


use app\common\ErrorCode;

class SystemIsClosedException extends BaseException
{
    protected $code = ErrorCode::SYSTEM_CLOSED;
}