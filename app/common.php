<?php
// 应用公共文件
use app\common\response\Response;
use think\Container;
use think\helper\Str;

/**
 * 获取模型
 * @param $name
 * @param mixed ...$args
 * @return mixed
 */
function model($name, ...$args)
{
    $class = strpos('\\', $name) !== false ? $name : 'app\model\\' . Str::studly($name);
    $model = Container::getInstance()->invokeClass($class, $args);

    return $model;
}

/**
 * 成功返回助手函数
 * @param $data
 * @param string $msg
 * @return array
 */
function success($data = [], $msg = '')
{
    return (new Response())->driver()->success($data, $msg);
}

/**
 * 失败返回助手函数
 * @param $code
 * @param string $msg
 * @param array $data
 * @return array
 */
function error($code, $msg = '', $data = [])
{
    return (new Response())->driver()->error($code, $msg, $data);
}

/**
 * 获取当前访问的路由
 * @param bool $snake
 * @return string
 */
function get_route($snake = false)
{
    $request = app()->request;
    //获取路由
    $module     = app()->http->getName();
    $controller = $request->controller();
    $action     = $request->action();

    if ($snake) {
        $controller = \think\helper\Str::snake($controller);
        $action     = \think\helper\Str::snake($action);
    }

    $route = $module . '/' . $controller . '/' . $action;

    return $route;
}


/**
 * 获取当前不带版本号的路由
 * @param bool $snake
 * @return string|string[]|null
 */
function get_route_without_version($snake = false)
{
    $route = get_route($snake);

    $route = str_replace('/_', '/', trim_version($route));

    return $route;
}

/**
 * 去除版本号
 * @param $value
 * @return string|string[]|null
 */
function trim_version($value)
{
    $value = preg_replace('#v\d+\.#', '', $value);

    return $value;
}

/**
 * like条件的字符串进行转义
 * @param $value
 * @return mixed|string|string[]
 */
function filter_like_char($value)
{
    if (is_string($value)) {
        $value = str_replace(['_', '%'], ['\_', '\%'], $value);
    }

    return $value;
}

/**
 * 移除XSS攻击
 * @param $string
 * @return string|string[]|null
 */
function remove_xss($string)
{
    $config        = HTMLPurifier_Config::createDefault();
    $html_purifier = new HTMLPurifier($config);
    $html          = $html_purifier->purify($string);

    return $html;
}

/**
 * 字符串转十六进制
 * @param $str
 * @return string
 */
function str2hex($str)
{
    $str = (string)$str;
    $hex = "";
    for ($i = 0; $i < strlen($str); $i++) $hex .= dec2hex(ord($str[$i]));
    $hex = strtoupper($hex);
    return $hex;
}

/**
 * 十进制加上前导0
 * @param $num
 * @param int $len
 * @return string
 */
function dec2hex($num, $len = 2)
{
    $n = str_pad(dechex($num), $len, '0', STR_PAD_LEFT);

    return $n;
}

/**
 * 十六进制转字符串
 * @param $hex
 * @return string
 */
function hex2str($hex)
{
    $str = "";
    for ($i = 0; $i < strlen($hex) - 1; $i += 2) $str .= chr(hexdec($hex[$i] . $hex[$i + 1]));
    return $str;
}

/**
 * hex数据BBC异或校验(两两比较)
 * @param array|String $hex1
 * @param String $hex2
 * @return string
 */
function hex_xor($hex1, $hex2 = null)
{
    if (is_array($hex1)) {

        $result = $hex1[0];
        $fun    = __FUNCTION__;
        for ($i = 0; $i < count($hex1) - 1; $i++) {
            $result = $fun($result, $hex1[$i + 1]);
        }

        return $result;
    }

    $bin1   = base_convert($hex1, 16, 2);
    $bin2   = base_convert($hex2, 16, 2);
    $len1   = strlen($bin1);
    $len2   = strlen($bin2);
    $result = '';

    //如果不相等判断补齐再异或
    if ($len1 != $len2) {
        if ($len1 > $len2) {
            $temp = '';
            for ($i = 0; $i < $len1 - $len2; $i++) {
                $temp .= '0';
            }
        } else {
            $temp = '';
            for ($i = 0; $i < $len2 - $len1; $i++) {
                $temp .= '0';
            }
        }

        $bin2 = $temp . $bin2;//不足补0
    }

    for ($i = 0; $i < $len1; $i++) {
        $result .= $bin1[$i] == $bin2[$i] ? '0' : '1';
    }


    return strtoupper(base_convert($result, 2, 16));
}

/**
 * 客户端链接
 * @param string $uri PATH地址
 * @param array $query 参数
 * @param string $key 配置的链接KEY
 * @return string
 */
function client_url($uri = '', $query = [], $key = 'client_host')
{
    $url = config('web.' . $key) . $uri;

    if ($query) {
        $url .= strpos($url, '?') ? '&' : '?';

        $url .= is_string($query) ? $query : http_build_query($query);
    }

    return $url;
}

/**
 * 将浮点数的.00去除
 * @param $num
 * @param int $y 浮点数的位数
 * @return int|mixed
 */
function trim_float_zero($num, int $y = 2)
{
    $n = pow(10, $y);

    $num *= $n;

    return ($num % $n == 0 ? (int)$num : $num) / $n;
}

/**
 * Modbus RTU CRC16校验
 * @param $string
 * @param int $length
 * @return string
 */
function crc16($string, $length = 0)
{
    $string = pack('H*', $string);

    $auchCRCHi = [
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
        0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
        0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
        0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81,
        0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,
        0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
        0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
        0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
        0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01,
        0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
        0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
        0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,
        0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01,
        0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81,
        0x40,
    ];
    $auchCRCLo = [
        0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4,
        0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,
        0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD,
        0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
        0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7,
        0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,
        0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE,
        0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
        0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2,
        0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,
        0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB,
        0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
        0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91,
        0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,
        0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88,
        0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
        0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80,
        0x40,
    ];
    $length    = ($length <= 0 ? strlen($string) : $length);
    $uchCRCHi  = 0xFF;
    $uchCRCLo  = 0xFF;
    $uIndex    = 0;
    for ($i = 0; $i < $length; $i++) {
        $uIndex   = $uchCRCLo ^ ord(substr($string, $i, 1));
        $uchCRCLo = $uchCRCHi ^ $auchCRCHi[$uIndex];
        $uchCRCHi = $auchCRCLo[$uIndex];
    }
    $crc = (chr($uchCRCLo) . chr($uchCRCHi));

    return strtoupper(unpack("H*", $crc)[1]);
}

/**
 * 验证CRC
 * @param $string
 * @return bool
 */
function verify_crc($string)
{
    $crc = crc16(substr($string, 0, -4));

    $string_crc = substr($string, -4);

    return $crc === $string_crc;
}

/**
 * 获取当前的小数点时间
 * @param int $n
 * @return float
 */
function get_float_time($n = 2)
{
    [$s1, $s2] = explode(' ', microtime());
    return round((float)sprintf('%.0f', (floatval($s1) + floatval($s2)) * 1000), $n);
}

/**
 * 字符串转数组
 * @param $string
 * @param string $format
 * @param string $char
 * @return array|string[]
 */
function string2array($string, $format = '', $char = ',')
{
    if (is_string($string)) {
        $array = explode($char, $string);
    } else {
        $array = (array)$string;
    }

    $array = array_map(function ($it) use ($format) {
        if ($format && is_callable($format)) {
            $it = $format($it);
        }
        return $it;
    }, array_filter($array, function ($it) {
        return !!$it;
    }));

    return $array;
}

/**
 * 计算两个时间有指定时间格式的次数
 * @param string $format 格式
 * @param string|int $startDate 起始时间
 * @param string|int $endDate 截止时间
 * @return false|float|int
 */
function date_time_diff($format, $startDate, $endDate)
{
    $startTime = is_string($startDate) ? strtotime($startDate) : $startDate;
    $endTime   = is_string($endDate) ? strtotime($endDate) : $endDate;

    $minTime = min($startTime, $endTime);
    $maxTime = max($startTime, $endTime);

    $sd = date("d", $startTime);
    $ed = date("d", $endTime);

    $sm = date("m", $startTime);
    $em = date("m", $endTime);

    $sy = date("Y", $startTime);
    $ey = date("Y", $endTime);

    $differ = $endTime - $startTime;
    if ($differ <= 0) return 0;

    switch (strtolower($format)) {

        case 'd': // days
        case 'day':

            $divisor = 86400;

            return (int)ceil($differ / $divisor);
        case 'w': // weeks
        case 'week':

            $i = 0;

            while (($minTime = strtotime("+1 DAY", $minTime)) <= $maxTime) $i++;

            return (int)ceil($i / 7);
        case 'm': // months
        case 'month':

            $i = 1;

            while (($minTime = strtotime("+1 MONTH", $minTime)) <= $maxTime) $i++;

            return $i;

        case "q": // quarter (3 months)
        case 'quarter':

            $i = 1;

            while (($minTime = strtotime("+3 MONTH", $minTime)) <= $maxTime) $i++;

            return $i;
        case 'y': // year
        case 'year':

            $i = 1;
            while (($minTime = strtotime("+1 YEAR", $minTime)) <= $maxTime) $i++;

            return $i;
    }

}

/**
 * 获取站点配置
 * @param null $key
 * @param null $default
 * @return mixed
 */
function site($key = null, $default = null)
{
    return config('site.' . $key, $default);
}

/**
 * 获取配置
 * @param null $key
 * @param null $default
 * @return mixed
 */
function web($key = null, $default = null)
{
    return config('web.' . $key, $default);
}

/**
 * 是否本地开发
 * @return mixed
 */
function is_dev()
{
    return config('web.is_dev') || env('IS_DEV');
}

/**
 * 获取上线设备的类型
 * @param $hex
 * @param int $default
 * @return int|mixed
 */
function get_device_online_type($hex, $default = 1)
{
    $string = hex2str($hex);

    preg_match('#\d+#', $string, $match);

    $type = $match[0] ?? $default;

    return $type;
}