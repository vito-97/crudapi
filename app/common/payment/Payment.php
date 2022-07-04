<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 14:43
 */

namespace app\common\payment;


use app\common\basic\Storage;
use GuzzleHttp\Client;
use think\exception\ValidateException;
use think\facade\Request;

class Payment extends Storage
{
    //正式接口
    protected $api = '';
    //测试接口
    protected $testApi = '';

    protected $isTest = false;
    //接口对应的路径
    protected $uri = [];

    protected $response;

    /**
     * 统一参数转换
     * mch_id 商户号
     * app_id 应用ID
     * amount 金额 分
     * order_no 订单号
     * return_url 同步跳转
     * notify_url 异步通知
     * @var array
     */
    protected $formatArgs = [];

    protected function getDefaultDriver(): string
    {
        $config = config('web.payment');
        return $config['default'] ?? 'AllInPay';
    }

    /**
     * 格式化参数
     * @param $args
     * @param string $method
     * @return array
     */
    public function formatArgs($args, $method = '')
    {
        $params = $this->appendArgs($args, $method);

        foreach ($this->formatArgs as $alias => $key) {
            if (isset($params[$key])) {
                $params[$alias] = $params[$key];
                unset($params[$key]);
            }
        }

        $params['sign'] = $this->sign($params);

        return $params;
    }

    /**
     * 转换回调参数
     * @param $args
     * @return mixed
     */
    public function formatBackArgs($args)
    {
        foreach ($this->formatArgs as $alias => $key) {
            if (isset($args[$alias])) {
                $args[$key] = $args[$alias];
                unset($args[$alias]);
            }
        }

        return $args;
    }

    public function sign(array $params)
    {
        return '';
    }

    public function valid(array $params = [], $sign = null)
    {
        return false;
    }

    /**
     * 追加参数
     * @param $args
     * @param string $method
     * @return mixed
     */
    protected function appendArgs($args, $method = '')
    {
        return $args;
    }

    protected function toUrlParams($array = [])
    {
        unset($array['sign']);
        ksort($array);
        $buff = "";
        foreach ($array as $k => $v) {
            if ($v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }

        $buff = trim($buff, "&");
        return $buff;
    }

    /**
     * 获取接口API的URI地址
     * @param $name
     * @return string
     * @throws ValidateException
     */
    protected function getApiUri($name)
    {
        $uri = $this->uri[$name] ?? '';

        if (!$uri) {
            throw new ValidateException("{$name}没有对应的URI");
        }

        return $uri;
    }

    /**
     * 获取API地址
     * @return string
     * @throws ValidateException
     */
    protected function getApi()
    {
        $api = ($this->isTest ? $this->testApi : $this->api);

        if (!$api) {
            throw new ValidateException('请先设置请求的API');
        }

        return $api;
    }

    /**
     * 请求接口
     * @param $name
     * @param $params
     * @param string $method
     * @return string
     * @throws ValidateException
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    protected function request($name, $params, $method = 'POST')
    {
        $client = $this->getRequestClient();

        $options = [
            'headers'         => [
                'User-Agent' => Request::server('HTTP_USER_AGENT'),
            ],
            'verify'          => false,
            'allow_redirects' => false,
            'http_errors'     => false,
        ];

        if ($params) {
            switch (strtolower($method)) {
                case 'get':
                    $options['query'] = $params;
                    break;
                case 'post':
                    $options['form_params'] = $params;
                    break;
            }
        }

        $this->response = $client->request($method, $this->getApiUri($name), $options);

        $result = (string)$this->response->getBody();

        return @json_decode($result, true);
    }

    protected function getRequestClient()
    {
        static $client;

        if (!$client) {
            $client = new Client(['base_uri' => $this->getApi()]);
        }

        return $client;
    }
}