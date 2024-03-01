<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\crud;


use app\common\crud\Save;
use app\common\ErrorCode;

trait CrudSave
{
    public function save()
    {
        return $this->callCrudMethod(__FUNCTION__);
    }

    /**
     * 保存数据
     * @param Save $crud
     * @return array
     */
    protected function _save(Save $crud)
    {
        $status = $crud->run()->getQueryStatus();

        if ($status) {
            return success($crud->getData(), "新增{$this->name}成功");
        } else {
            return error(ErrorCode::SAVE_DATA_ERROR, "新增{$this->name}失败");
        }
    }
}
