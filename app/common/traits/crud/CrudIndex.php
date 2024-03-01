<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\crud;


use app\common\crud\Index;

trait CrudIndex
{
    public function index()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 获取数据列表
     * @param Index $crud
     * @return array
     */
    protected function _index(Index $crud)
    {
        $crud->run();

        $result = $crud->getData();
        return success($result, "获取{$this->name}成功");
    }
}
