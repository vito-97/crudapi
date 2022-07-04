<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 11:14
 */

namespace app\exception;


use app\common\ErrorCode;

class EmptyParamsException extends BaseException
{
    protected $code = ErrorCode::EMPTY_PARAMS[0];
    protected $message = ErrorCode::EMPTY_PARAMS[1];
}