<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 16:25
 */

namespace app\exception;

use app\common\ErrorCode;

class DataNotFoundException extends BaseException
{
    protected $code = ErrorCode::DATA_NOT_FOUND[0];
    protected $message = ErrorCode::DATA_NOT_FOUND[1];
}