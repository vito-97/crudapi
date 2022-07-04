<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\curd;


use app\common\curd\Read;

trait CurdRead
{
    public function read()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 读取数据
     * @param Read $curd
     * @return array
     */
    protected function _read(Read $curd)
    {
        $curd->run();

        $result = $curd->getData();

        return success($result, "获取{$this->name}成功");
    }
}