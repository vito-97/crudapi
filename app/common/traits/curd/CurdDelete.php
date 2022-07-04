<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\curd;


use app\common\curd\Delete;
use app\common\ErrorCode;

trait CurdDelete
{
    public function delete()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 删除数据
     * @param Delete $curd
     * @return array
     */
    protected function _delete(Delete $curd)
    {
        $status = $curd->run()->getQueryStatus();

        if ($status) {
            return success([], "删除{$this->name}成功");
        } else {
            return error(ErrorCode::DELETE_DATA_ERROR, "删除{$this->name}失败");
        }
    }
}