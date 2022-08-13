<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/2
 * Time: 16:04
 */

namespace app\exception;

use app\common\ErrorCode;

class FileIsExistsException extends BaseException
{
    protected $code = ErrorCode::FILE_IS_EXISTS[0];
    protected $message = ErrorCode::FILE_IS_EXISTS[1];
}
