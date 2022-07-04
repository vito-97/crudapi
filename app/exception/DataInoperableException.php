<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/28
 * Time: 17:39
 */

namespace app\exception;


use app\common\ErrorCode;

class DataInoperableException extends BaseException
{
    protected $code = ErrorCode::DATA_INOPERABLE[0];
    protected $message = ErrorCode::DATA_INOPERABLE[1];
}