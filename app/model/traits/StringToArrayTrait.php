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
                $char = ':';
                if (strpos($item, '=')) {
                    $char = '=';
                }
                $arr = explode($char, $item);

                if (count($arr) > 1) {
                    [$k, $v] = array_map('trim', $arr);

                    if (in_array($v, ['true', 'false'])) {
                        $v = $v === 'true';
                    }

                    $value[$k] = $v;
                }
            }
        }

        return $value;
    }
}
