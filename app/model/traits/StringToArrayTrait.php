<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/12
 * Time: 10:06
 */

namespace app\model\traits;


trait StringToArrayTrait
{
    protected function stringToArray($value)
    {
        if (is_string($value)) {
            $string = str_replace(["\r\n", "\r"], "\n", $value);

            $array = array_filter(explode("\n", $string));

            $value = [];

            foreach ($array as $item) {
                $val = explode('|', $item);

                if (count($val) > 1) {
                    $value[trim($val[0])] = $val[1];
                }
            }
        }

        return $value;
    }
}