<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 10:45
 */

namespace app\exception;


use app\common\ErrorCode;

class NotAuthException extends BaseException
{
    protected $code = ErrorCode::NOT_AUTH[0];
    protected $message = ErrorCode::NOT_AUTH[1];
}