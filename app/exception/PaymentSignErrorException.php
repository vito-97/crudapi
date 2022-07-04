<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 15:26
 */

namespace app\exception;


use app\common\ErrorCode;

class PaymentSignErrorException extends BaseException
{
    protected $code = ErrorCode::PAYMENT_SIGN_ERROR[0];
    protected $message = ErrorCode::PAYMENT_SIGN_ERROR[1];
}