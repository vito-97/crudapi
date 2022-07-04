<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 17:09
 */

namespace app\exception;


use app\common\ErrorCode;

class ParamErrorException extends BaseException
{
    protected $code = ErrorCode::PARAM_ERROR[0];
    protected $message = ErrorCode::PARAM_ERROR[1];
}