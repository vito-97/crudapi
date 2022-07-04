<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:51
 */

namespace app\agent\controller;


use app\common\ErrorCode;

class Error
{
    public function __call($name, $arguments)
    {
        return error(ErrorCode::CONTROLLER_NOT_FOUND);
    }
}