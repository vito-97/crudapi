<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:51
 */

namespace app\exception;


use app\common\ErrorCode;

class PasswordErrorException extends BaseException
{
    protected $code = ErrorCode::PASSWORD_ERROR[0];
    protected $message = ErrorCode::PASSWORD_ERROR[1];
}