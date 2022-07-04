<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:30
 */

namespace app\exception;


use app\common\ErrorCode;

class UserNotFoundException extends BaseException
{
    protected $code = ErrorCode::USER_NOT_FOUND[0];
    protected $message = ErrorCode::USER_NOT_FOUND[1];
}