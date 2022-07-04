<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\curd;


use app\common\curd\Update;
use app\common\ErrorCode;

trait CurdUpdate
{
    public function update()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 更新数据
     * @param Update $curd
     * @return array
     */
    protected function _update(Update $curd)
    {
        $status = $curd->run()->getQueryStatus();

        if ($status) {
            $result = $curd->getData();

            return success($result, "更新{$this->name}成功");
        } else {
            return error(ErrorCode::UPDATE_DATA_ERROR, "更新{$this->name}失败");
        }
    }
}