<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:36
 */

namespace app\common\response\driver;


use app\common\response\Response;
use app\common\response\ResponseInterface;

class Json extends Response
{
    protected function formatData()
    {
        return json($this->getData());
    }
}