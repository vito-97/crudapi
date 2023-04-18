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
     * @param int $datacenter
     * @param int $workerid
     * @return string
     */
    public static function generateOrderNo(int $datacenter = -1, int $workerid = -1)
    {
        $order_no = date('ymdHis');

        // 取毫秒
        $millisecond = substr(microtime(), 2, 3);

        $datacenter = $datacenter > 31 || $datacenter < 0 ? mt_rand(0, 31) : $datacenter;
        $workerid   = $workerid > 31 || $workerid < 0 ? mt_rand(0, 31) : $workerid;

        $workerLength             = 5; // $datacenter 和 $workerid 占用的位数
        $workerLeftMoveLength     = 12; // 随机位 12 位 即 4095
        $datacenterLeftMoveLength = $workerLeftMoveLength + $workerLength; // 17 $workerid 5 位 即 31
        $timestampLeftMoveLength  = $datacenterLeftMoveLength + $workerLength; // 22

        // 毫秒时间戳 10 位 0 - 1023 （最高位可能是0, 生成后高位补0）
        $ext = (string)(((intval($millisecond)) << $timestampLeftMoveLength)
            | ($datacenter << $datacenterLeftMoveLength)
            | ($workerid << $workerLeftMoveLength)
            | (mt_rand(0, 4095))); // 随机位
        // 前置补0 10位
        $order_no .= str_pad($ext, 10, '0', STR_PAD_LEFT);

        return $order_no;
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
     * 去除包含域名的链接
     * @param $url
     * @return string|string[]
     */
    public static function unlink($url)
    {
        return str_replace(request()->domain(), '', $url);
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

            $array[$key][$subKey] = [];
            $refs[$item[$pk]]     = &$array[$key];
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
