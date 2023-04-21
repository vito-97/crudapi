<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/11
 * Time: 9:30
 */

namespace app\api\controller;

use app\model\Adverts;
use think\helper\Str;

class Test extends BaseController
{
    const NOT_NEED_LOGIN = ['*'];

    public function index($type = '')
    {
        $name = Str::camel($type);

        if (method_exists($this, $name)) {
            return $this->$name();
        } else {
            return '测试方法不存在';
        }
    }

    public function db()
    {
        $res = Adverts::select();

        dump($res->toArray());

        dump(Adverts::fetchSql()->select());
    }

    protected function e($msg)
    {
        echo $msg . '<br>';
    }
}
