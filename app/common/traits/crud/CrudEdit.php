<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\crud;


use app\common\crud\Edit;

trait CrudEdit
{
    public function edit()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 获取编辑时和新建时的数据
     * @param Edit $crud
     * @return array
     */
    protected function _edit(Edit $crud)
    {
        $crud->run();

        $result = $crud->getData();

        return success($result, "获取{$this->name}成功");
    }
}
