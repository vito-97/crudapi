<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/10
 * Time: 11:48
 */

namespace app\exception;


use app\common\ErrorCode;

class SaveDataErrorException extends BaseException
{
    protected $code = ErrorCode::SAVE_DATA_ERROR;
}