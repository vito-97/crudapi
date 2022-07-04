<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:25
 */

namespace app\common\traits\curd;


use app\common\curd\Save;
use app\common\ErrorCode;

trait CurdSave
{
    public function save()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 保存数据
     * @param Save $curd
     * @return array
     */
    protected function _save(Save $curd)
    {
        $status = $curd->run()->getQueryStatus();

        if ($status) {
            return success($curd->getData(), "新增{$this->name}成功");
        } else {
            return error(ErrorCode::SAVE_DATA_ERROR, "新增{$this->name}失败");
        }
    }
}