<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\curd;


use app\common\curd\Index;

trait CurdIndex
{
    public function index()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 获取数据列表
     * @param Index $curd
     * @return array
     */
    protected function _index(Index $curd)
    {
        $curd->run();

        $result = $curd->getData();
        return success($result, "获取{$this->name}成功");
    }
}