<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/9
 * Time: 16:56
 */

namespace app\exception;


use app\common\ErrorCode;

class MessageException extends BaseException
{
    protected $code = ErrorCode::MESSAGE_ERROR[0];
    protected $message = ErrorCode::MESSAGE_ERROR[1];
}