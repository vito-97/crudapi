<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\crud;


use app\common\crud\Update;
use app\common\ErrorCode;

trait CrudUpdate
{
    public function update()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 更新数据
     * @param Update $crud
     * @return array
     */
    protected function _update(Update $crud)
    {
        $status = $crud->run()->getQueryStatus();

        if ($status) {
            $result = $crud->getData();

            return success($result, "更新{$this->name}成功");
        } else {
            return error(ErrorCode::UPDATE_DATA_ERROR, "更新{$this->name}失败");
        }
    }
}
