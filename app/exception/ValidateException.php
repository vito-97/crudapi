<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:27
 */

namespace app\exception;


use app\common\ErrorCode;

class ValidateException extends BaseException
{
    protected $code = ErrorCode::VALIDATE_ERROR[0];
    protected $message = ErrorCode::VALIDATE_ERROR[1];
}