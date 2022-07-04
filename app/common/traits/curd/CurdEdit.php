<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 16:26
 */

namespace app\common\traits\curd;


use app\common\curd\Edit;

trait CurdEdit
{
    public function edit()
    {
        return $this->callCurdMethod(__FUNCTION__);
    }

    /**
     * 获取编辑时和新建时的数据
     * @param Edit $curd
     * @return array
     */
    protected function _edit(Edit $curd)
    {
        $curd->run();

        $result = $curd->getData();

        return success($result, "获取{$this->name}成功");
    }
}