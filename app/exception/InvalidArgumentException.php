<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 16:39
 */

namespace app\exception;


use app\common\ErrorCode;

class InvalidArgumentException extends BaseException
{
    protected $code = ErrorCode::INVALID_ARGUMENT[0];
    protected $message = ErrorCode::INVALID_ARGUMENT[1];
}