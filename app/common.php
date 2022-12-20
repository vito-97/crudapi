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
 * 获取类名
 * @param $class
 * @return string
 */
function get_class_name($class)
{
    $name = str_replace('\\', '/', $class);
    $name = basename($name);
    return $name;
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
 * 去除emoji表情
 * @param $str
 * @return string|string[]|null
 */
function trim_emoji($str)
{
    $str = preg_replace_callback(
        '/./u',
        function (array $match) {
            return strlen($match[0]) >= 4 ? '' : $match[0];
        },
        $str);

    return $str;
}
