<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/16
 * Time: 14:39
 */

namespace app\exception;


use app\common\ErrorCode;

class AccessTokenEmptyException extends BaseException
{
    protected $code = ErrorCode::ACCESS_TOKEN_EMPTY[0];

    protected $message = ErrorCode::ACCESS_TOKEN_EMPTY[1];
}