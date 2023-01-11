<?php
/**
 * Created by PhpStorm.
 * User: vito
 * Date: 2022/10/29
 * Time: 22:53
 */

namespace app\admin\curd\category;


trait CategoryCurdTrait
{
    public function getTopLabel()
    {
        $result = $this->logic->getTop(['id', 'name']);

        $result->unshift(['id' => 0, 'name' => '请选择']);

        return $result;
    }
}
