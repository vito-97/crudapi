<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/24
 * Time: 22:07
 */

namespace app\common\traits;

trait ResponseTrait
{
    /**
     * 成功返回
     * @param $data
     * @param string $msg
     * @return array
     */
    protected function success($data = [], string $msg = '')
    {
        return success($data, $msg);
    }

    /**
     * 失败返回
     * @param $code
     * @param string $msg
     * @param array $data
     */
    protected function error($code, $msg = '', $data = [])
    {
        return error($code, $msg, $data);
    }
}
