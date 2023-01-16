<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 15:43
 */

namespace app\model\traits;


trait IpTrait
{
    /**
     * 获取IP
     * @param $value
     * @return mixed|string
     */
    protected function _getIpAttr($value)
    {
        if ($value) {
            $value = long2ip($value);
        }

        return $value ?: '';
    }

    /**
     * 设置IP
     * @param $value
     * @return false|int|mixed|string
     */
    protected function _setIpAttr($value)
    {
        if ($value) {
            if (!is_numeric($value)) {
                $value = sprintf('%u', ip2long($value));;
            }
        }

        return $value;
    }
}
