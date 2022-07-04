<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:33
 */

namespace app\exception;

use app\common\ErrorCode;

class TouristUserLoginErrorException extends BaseException
{
    protected $code = ErrorCode::TOURIST_USER_LOGIN_ERROR[0];
    protected $message = ErrorCode::TOURIST_USER_LOGIN_ERROR[1];
}