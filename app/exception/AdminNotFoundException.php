<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:41
 */

namespace app\exception;


use app\common\ErrorCode;

class AdminNotFoundException extends BaseException
{
    protected $code = ErrorCode::ADMIN_NOT_FOUND[0];
    protected $message = ErrorCode::ADMIN_NOT_FOUND[1];
}