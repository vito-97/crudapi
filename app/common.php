<?php
// 应用公共文件
use app\common\response\Response;
use think\Container;
use think\facade\Lang;
use think\helper\Str;

/**
 * 获取模型
 * @param $name
 * @param mixed ...$args
 * @return \app\model\BaseModel
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
 * @param bool $iframe
 * @return string|string[]|null
 */
function remove_xss($string, $iframe = true)
{
    $config = HTMLPurifier_Config::createDefault();
    if ($iframe) {
        $config->set('Filter.Custom', array(new \app\common\html\HTMLPurifier_Filter_MyIframe()));
    }
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
    if (is_object($class)) {
        $class = get_class($class);
    }

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
            return (int)ceil($differ / (7 * 86400));
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

/**
 * 获取配置
 * @param $key
 * @param $default
 * @param string $filter
 * @return mixed
 */
function get_config($key = null, $default = '', $filter = 'htmlentities')
{
    /**
     * @var $logic \app\logic\SystemConfigLogic
     */
    $logic = Container::getInstance()->make(\app\logic\SystemConfigLogic::class);

    $value = $logic->config($key, $default);

    if ($filter && is_callable($filter)) {
        $value = $filter($value);
    }

    return $value;
}

/**
 * 自定义生成URL
 * @param string $url
 * @param array $vars
 * @param $suffix
 * @param $domain
 * @return string
 */
function url(string $url = '', array $vars = [], $suffix = true, $domain = false)
{
    if (!is_default_lang_set()) {
        $vars['lang'] = Lang::getLangSet();
    }

    $u = \think\facade\Route::buildUrl($url, $vars)->suffix($suffix)->domain($domain);

    $defaultApp = '/' . \think\facade\Config::get('app.default_app');

    if (strpos((string)$u, $defaultApp) === 0) {
        $u = preg_replace('#' . $defaultApp . '#', '', $u);
    }

    return $u;
}

/**
 * 获取消息类里的内容
 * @param $key
 * @return mixed
 */
function msg_lang($key)
{
    $key = str_replace(' ', '_', $key);

    return lang(constant(\app\common\Message::class . '::' . strtoupper($key)));
}

/**
 * 获取广告列表
 * @return \app\model\BaseModel|\app\model\BaseModel[]|array|mixed|\think\Collection|\think\db\BaseQuery|\think\Paginator
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_adverts_list()
{
    return get_list('adverts', ['where' => ['status' => 1]]);
}

/**
 * 获取数据
 * @param $model
 * @param $args
 * @return \app\model\BaseModel|\app\model\BaseModel[]|array|mixed|\think\Collection|\think\db\BaseQuery|\think\Paginator
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_list($model, $args = [])
{
    static $data = [];
    $key = $model . '-' . md5(json_encode($args));

    if (!isset($data[$key])) {
        $model      = model($model);
        $data[$key] = $model->getAll($args);
    }

    return $data[$key];
}

/**
 * 获取文章分类
 * @param $index
 * @return \app\common\ArrayObject|mixed
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_posts_cate($index = null)
{
    $logic = new \app\logic\PostsCategoryLogic();

    $data = $logic->all();

    return $index ? $logic->one($index) : $data;
}

/**
 * 获取一级分类
 * @return array|mixed
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_posts_top_cate()
{
    $logic = new \app\logic\PostsCategoryLogic();

    $data = $logic->top();

    return $data;
}

/**
 * 获取子类
 * @param $index
 * @return array|mixed
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_posts_cate_children($index)
{
    $logic = new \app\logic\PostsCategoryLogic();

    return $logic->getChildren($index);
}

/**
 * 获取文章列表
 * @param $index
 * @param $args
 * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\db\BaseQuery|\think\Paginator
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_posts_list($index, $args = [])
{
    $logic = new \app\logic\PostsLogic();

    return $logic->getListByCate($index, $args);
}

/**
 * 获取该分类下最新的一条
 * @param $index
 * @return \app\model\BaseModel|\app\model\Posts|array|mixed|\think\db\BaseQuery|\think\Model|null
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 */
function get_new_posts($index)
{
    $logic = new \app\logic\PostsLogic();

    return $logic->one($index);
}

/**
 * 文章分类路由
 * @param $index
 * @return string
 */
function posts_cate_route($index)
{
    return url('Posts/index', ['index' => $index]);
}

/**
 * 是否为默认语言
 * @return bool
 */
function is_default_lang_set($lang = null)
{
    $lang        = $lang ?? Lang::getLangSet();
    $defaultLang = Lang::defaultLangSet();

    return $lang === $defaultLang;
}

/**
 * 获取语言链接
 * @param $lang
 * @return string
 */
function get_lang_link($lang)
{
    $isDefault = is_default_lang_set($lang);
    $baseUrl   = \think\facade\Request::baseUrl();
    $param     = \think\facade\Request::get();
    $langVar   = \think\facade\Config::get('lang.detect_var');

    if ($isDefault) {
        unset($param[$langVar]);
    } else {
        $param[$langVar] = $lang;
    }

    $queryString = http_build_query($param);

    return $baseUrl . ($queryString ? '?' : '') . http_build_query($param);
}

/**
 * 生成新的列表链接
 * @param array $query 追加参数
 * @param array $unset 要移除的参数
 * @return string
 */
function get_list_url($query = [], $unset = [])
{
    $baseUrl = \think\facade\Request::baseUrl();

    $param = \think\facade\Request::get();
    unset($param['page']);

    foreach ($query as $key => $value) {
        $key   = str_replace(['[', ']'], ['.', ''], $key);
        $array = explode('.', $key);
        $len   = count($array);
        switch ($len) {
            case 2:
                $param[$array[0]][$array[1]] = $value;
                break;
            case 3:
                $param[$array[0]][$array[1]][$array[2]] = $value;
                break;
            default:
                $param[$key] = $value;
                break;
        }
    }

    foreach ($unset as $field) {
        $field = str_replace(['[', ']'], ['.', ''], $field);

        $array = explode('.', $field);
        $len   = count($array);
        $p     = &$param;
        foreach ($array as $i => $key) {
            if (isset($p[$key])) {
                if ($i == $len - 1) {
                    unset($p[$key]);
                } else {
                    $p = &$p[$key];
                }
            } else {
                break;
            }
        }

        unset($p);
    }

    $queryString = http_build_query($param);

    return $baseUrl . ($queryString ? '?' : '') . http_build_query($param);
}

/**
 * 获取列表参数状态
 * @param $query
 * @return bool
 */
function get_list_option_status($query = [])
{
    $param  = \think\facade\Request::get();
    $status = true;

    foreach ($query as $field => $value) {
        $field = str_replace(['[', ']'], ['.', ''], $field);
        $array = explode('.', $field);
        $val   = &$param;

        foreach ($array as $i => $key) {
            if (isset($val[$key])) {
                $val = &$val[$key];
            } else {
                $val = '';
                break;
            }
        }


        if ($value != $val) {
            return false;
        }

        unset($val);
    }

    return $status;
}

/**
 * 获取条件里面指定值
 * @param $field
 * @param $where
 * @return mixed
 */
function get_where_value($field, $where = [])
{
    foreach ($where as $key => $value) {
        if (is_int($key)) {
            if ($value[0] === $field) {
                return $value[2];
            }
        } else {
            if ($field === $key) {
                return $value;
            }
        }
    }

    return '';
}

/**
 * 获取设置的语言
 * @return string
 */
function get_lang_set()
{
    return Lang::getLangSet();
}

/**
 * 调用异步方法
 * @param string $name
 * @param array $data
 * @return mixed
 */
function send_async_task(string $name, array $data = [])
{
    $default = config('async_task.default', 'tpc');
    $fn      = __FUNCTION__ . '_' . $default;
    return call_user_func($fn, $name, $data);
}

/**
 * TEXT协议方案
 * 发送异步任务
 * @param string $name 任务名称
 * @param array $data 数据
 * @return boolean
 */
function send_async_task_tcp(string $name, array $data = [])
{
    $status = false;
    try {
        $address      = 'tcp://127.0.0.1:2346';
        $result       = json_encode([
            'name' => $name,
            'data' => $data
        ]);
        $errorCode    = null;
        $errorMessage = null;
        $client       = stream_socket_client($address, $errorCode, $errorMessage, 5);
        $res          = @fwrite($client, $result . "\n");
        $response     = @fread($client, 3);
        $isSuccess    = trim($response) === 'ok';
        fclose($client);

        if ($res === false || !$isSuccess) {
            \think\facade\Log::write('执行异步任务失败：' . $result);
        }

        //响应成功
        if ($isSuccess) {
            $status = true;
        }
    } catch (Throwable $e) {
        \think\facade\Log::write('连接异步任务服务器失败：' . $result);
        send_async_task_queue($name, $data);
        throw new \app\exception\MessageException('TCP异步任务连接失败');
    }

    //调用失败则推入队列处理
    if (!$status) {
        send_async_task_queue($name, $data);
    }

    return $status;
}

/**
 * redis列表方案
 * 发送异步任务
 * @param string $name 任务名称
 * @param array $data 数据
 * @return int
 */
function send_async_task_redis(string $name, array $data = [])
{
    $result = json_encode([
        'name' => $name,
        'data' => $data
    ]);

    $status = \think\facade\Cache::lpush('async_task', $result);

    return $status;
}

/**
 * 队列方案
 * 发送异步任务
 * @param string $name 任务名称
 * @param array $data 数据
 * @return int
 */
function send_async_task_queue(string $name, array $data = [])
{
    $result = [
        'name' => $name,
        'data' => $data
    ];

    \think\facade\Queue::push(\app\job\AsyncTaskJob::class, $result, 'async_task');

    return true;
}

/**
 * 毫秒睡眠
 * @param int $ms
 * @return true
 */
function msleep(int $ms)
{
    usleep($ms * 1000);
    return true;
}
