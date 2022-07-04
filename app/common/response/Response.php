<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 16:04
 */

namespace app\common\response;


use app\common\basic\Storage;
use app\common\ErrorCode;
use think\facade\Lang;

class Response extends Storage
{
    protected $namespace = '';

    protected $data = [
        'code' => 0,
        'msg' => 'success',
        'data' => [],
    ];

    //多语言变量
    protected $langVar = [];

    /**
     * 默认驱动
     * @return string
     */
    protected function getDefaultDriver(): string
    {
        return 'json';
    }

    /**
     * 统一发送
     * @param int $code
     * @param string $msg
     * @param array $data
     * @return array
     */
    public function send($code = 0, $msg = '', $data = [])
    {
        if (is_array($code)) {
            $tmp = $code;
            $code = $tmp[0];
            $msg = $msg ?: $tmp[1];
            $langVar = $code[2] ?? [];

            $this->setLangVar($langVar);
        }

        $msg = Lang::get($msg, $this->langVar);

        $this->setData([
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
        ]);

        return $this->formatData();
    }

    /**
     * 成功返回
     * @param $data
     * @param string $msg
     * @return array
     */
    public function success($data = [], $msg = '')
    {
        if (is_string($data)) {
            $msg = $data;
            $data = [];
        }
        return $this->send(ErrorCode::SUCCESS, $msg, $data);
    }

    /**
     * 失败返回
     * @param $code
     * @param string $msg
     * @param array $data
     * @return array
     */
    public function error($code = ErrorCode::SERVICE_ERROR, string $msg = '', array $data = [])
    {
        return $this->send($code, $msg, $data);
    }

    /**
     * 获取数据
     * @return array
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * 设置数据
     * @param $args
     * @return $this
     */
    public function setData($args)
    {
        foreach ($this->data as $key => $value) {
            if (isset($args[$key])) {
                $this->data[$key] = $args[$key];
            }
        }

        //设置语言变量
        if (isset($args['lang_var'])) {
            $this->setLangVar($args['lang_var']);
        }

        $this->data['msg'] = $this->getMessage();

        return $this;
    }

    /**
     * 设置语言变量
     * @param array $vars
     * @return $this
     */
    public function setLangVar(array $vars)
    {
        if ($vars)
            $this->langVar = array_merge($this->langVar, $vars);

        return $this;
    }

    /**
     * 返回指定格式的数据
     * @return array
     */
    protected function formatData()
    {
        return $this->getData();
    }

    /**
     * 获取错误信息
     * @return mixed
     */
    protected function getMessage()
    {
        return $this->data['msg'] ?: lang($this->data['code']);
    }

    public function __toString()
    {
        return json_encode($this->getData());
    }
}