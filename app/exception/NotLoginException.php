<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 14:43
 */

namespace app\exception;


use app\common\ErrorCode;

class NotLoginException extends BaseException
{
    protected $code = ErrorCode::NOT_LOGIN[0];
    protected $message = ErrorCode::NOT_LOGIN[1];
}