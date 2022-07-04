<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/28
 * Time: 17:20
 */

namespace app\exception;


use app\common\ErrorCode;

class DataCannotBeDeletedException extends BaseException
{
    protected $code = ErrorCode::DATA_CANNOT_BE_DELETED[0];
    protected $message = ErrorCode::DATA_CANNOT_BE_DELETED[1];
}