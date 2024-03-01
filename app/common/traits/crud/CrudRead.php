<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\crud;


use app\common\crud\Read;

trait CrudRead
{
    public function read()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 读取数据
     * @param Read $crud
     * @return array
     */
    protected function _read(Read $crud)
    {
        $crud->run();

        $result = $crud->getData();

        return success($result, "获取{$this->name}成功");
    }
}
