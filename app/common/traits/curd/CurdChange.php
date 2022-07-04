<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\curd;


use app\common\curd\Change;
use app\common\ErrorCode;

trait CurdChange
{
    public function change()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 更改字段
     * @param Change $curd
     * @return array
     */
    protected function _change(Change $curd)
    {
        $status = $curd->run()->getQueryStatus();

        if ($status) {
            return success([], "修改{$this->name}成功");
        } else {
            return error(ErrorCode::CHANGE_DATA_ERROR, "修改{$this->name}失败");
        }
    }
}