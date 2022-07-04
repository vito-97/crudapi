<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 9:14
 */

namespace app\exception;


use app\common\ErrorCode;

class AccountDisabledException extends BaseException
{
    protected $code = ErrorCode::ACCOUNT_DISABLED[0];
    protected $message = ErrorCode::ACCOUNT_DISABLED[1];
}