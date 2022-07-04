<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 14:36
 */

namespace app\common\response\driver;


use app\common\response\Response;

class Xml extends Response
{
    protected function formatData()
    {
        return xml($this->getData());
    }
}