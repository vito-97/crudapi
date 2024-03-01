<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\crud;


use app\common\crud\Change;
use app\common\ErrorCode;

trait CrudChange
{
    public function change()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 更改字段
     * @param Change $crud
     * @return array
     */
    protected function _change(Change $crud)
    {
        $status = $crud->run()->getQueryStatus();

        if ($status) {
            return success([], "修改{$this->name}成功");
        } else {
            return error(ErrorCode::CHANGE_DATA_ERROR, "修改{$this->name}失败");
        }
    }
}
