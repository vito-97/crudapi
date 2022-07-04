<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/2
 * Time: 17:20
 */

namespace app\common;


class Util
{
    /**
     * 生成订单号
     * @param string $prefix 前缀
     * @return string
     */
    public static function orderNo($prefix = '')
    {
        return $prefix . date('YmdHis') . rand(100000, 999999);
    }

    /**
     * 生成完整链接
     * @param $uri
     * @param bool $domain
     * @return string
     */
    public static function link($uri, $domain = true)
    {
        if (!$uri) {
            return '';
        }
        if (filter_var($uri, FILTER_VALIDATE_URL)) {
            return $uri;
        }
        return $value = url($uri, [], false, $domain ?: true)->build();
    }

    /**
     * 设置域名
     * @param $url
     * @param array $params
     * @param bool $domain
     * @return string
     */
    public static function url($url, $params = [], $domain = true)
    {
        if (true === $domain) {
            $domain = self::buildUrlDomain();
        }

        return url($url, $params, false, $domain)->build();
    }

    /**
     * 设置或获取域名生成链接的域名
     * @param null $set
     * @return bool|mixed
     */
    public static function buildUrlDomain($set = null)
    {
        static $domain;

        if ($set)
            $domain = $set;

        if (!$domain)
            $domain = config('app.app_host') ?: true;

        return $domain;
    }

//    /**
//     * 无限极分类 递归
//     * @param $array
//     * @param int $pid
//     * @param string $pidKey
//     * @param string $pk
//     * @return array
//     */
//    public static function tree($array, $pid = 0, $pidKey = 'pid', $pk = 'id', $subKey = 'sub')
//    {
//        $data = [];
//
//        if (is_object($array)) {
//            if (method_exists($array, 'toArray'))
//                $array = $array->toArray();
//            else
//                $array = (array)$array;
//        }
//
//        foreach ($array as $key => $item) {
//            if ($item[$pidKey] == $pid) {
//                if (is_object($item)) {
//                    if (method_exists($item, 'toArray')) {
//                        $data[$key] = $item = $item->toArray();
//                    } else {
//                        $data[$key] = $item = (array)$item;
//                    }
//                }
//                unset($array[$key]);
//                $item[$subKey] = self::tree($array, $item[$pk], $pidKey, $pk);
//                $data[]        = $item;
//            }
//        }
//
//        return $data;
//    }

    /**
     * 无限极分类
     * 引用方式
     * @param $array
     * @param string $pidKey
     * @param string $pk
     * @param string $subKey
     * @return array
     */
    public static function tree($array, $pidKey = 'pid', $pk = 'id', $subKey = 'children')
    {
        $refs = [];
        $tree = [];

        if (is_object($array)) {
            if (method_exists($array, 'toArray'))
                $array = $array->toArray();
            else
                $array = (array)$array;
        }

        foreach ($array as $key => $item) {
            if (is_object($item)) {
                if (method_exists($item, 'toArray')) {
                    $array[$key] = $item->toArray();
                } else {
                    $array[$key] = (array)$item;
                }
            }

            $refs[$item[$pk]] = &$array[$key];
        }

        foreach ($array as $key => $item) {
            if (!$item[$pidKey]) {
                $tree[] = &$array[$key];
            } else {
                if (isset($refs[$item[$pidKey]])) {
                    $refs[$item[$pidKey]][$subKey][] = $item;
                }
            }
        }

        return $tree;
    }
}