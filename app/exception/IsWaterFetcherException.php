<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/22
 * Time: 17:17
 */

namespace app\exception;


use app\common\ErrorCode;

class IsWaterFetcherException extends BaseException
{
    protected $code = ErrorCode::USER_IS_WATER_FETCHER[0];

    protected $message = ErrorCode::USER_IS_WATER_FETCHER[1];
}
