<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:51
 */

namespace app\admin\controller;


use app\common\ErrorCode;

class Error extends BaseController
{
    const NOT_NEED_AUTH = ['*'];
    const NOT_NEED_LOGIN = ['*'];

    public function __call($name, $arguments)
    {
        return error(ErrorCode::CONTROLLER_NOT_FOUND);
    }
}