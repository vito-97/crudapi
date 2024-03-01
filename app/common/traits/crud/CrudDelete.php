<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\crud;


use app\common\crud\Delete;
use app\common\ErrorCode;

trait CrudDelete
{
    public function delete()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 删除数据
     * @param Delete $crud
     * @return array
     */
    protected function _delete(Delete $crud)
    {
        $status = $crud->run()->getQueryStatus();

        if ($status) {
            return success([], "删除{$this->name}成功");
        } else {
            return error(ErrorCode::DELETE_DATA_ERROR, "删除{$this->name}失败");
        }
    }
}
