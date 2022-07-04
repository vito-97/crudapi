<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 16:52
 */

namespace app\exception;


use app\common\ErrorCode;

class RegisterErrorException extends BaseException
{
    protected $code = ErrorCode::SAVE_DATA_ERROR[0];

    protected $message = ErrorCode::SAVE_DATA_ERROR[1];
}