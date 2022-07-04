<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 11:10
 */

namespace app\exception;


use app\common\ErrorCode;

class CreateTokenErrorException extends BaseException
{
    protected $code = ErrorCode::CREATE_TOKEN_ERROR[0];
    protected $message = ErrorCode::CREATE_TOKEN_ERROR[1];
}