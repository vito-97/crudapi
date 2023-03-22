<?php
/**
 * Created by PhpStorm.
 * User: vito
 * Date: 2022/11/16
 * Time: 16:04
 */

namespace app\model\traits;

use app\common\Util;
use think\facade\Request;

trait StaticUrlTrait
{
    protected function _getStaticUrlAttr($value)
    {
        if ($value) {
            $value = is_array($value) ? $value : json_decode($value, true);
        } else {
            $value = [];
        }

        foreach ($value as $key => &$item) {
            $item = Util::link($item);
        }

        return $value;
    }

    protected function _setStaticUrlAttr($value)
    {
        if ($value) {
            $value = is_array($value) ? $value : json_decode($value, true);
        } else {
            $value = [];
        }

        $host = Request::domain();

        foreach ($value as $key => &$item) {
            if (strpos($item, $host) === 0) {
                $item = Util::unlink($item);
            }
        }

        return json_encode($value);
    }
}
