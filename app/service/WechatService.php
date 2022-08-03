<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 14:57
 */

namespace app\service;

use app\logic\SystemConfigLogic;
use EasyWeChat\Factory;

/**
 * @mixin \EasyWeChat\OfficialAccount\Application
 * Class WechatService
 * @package app\service
 */
class WechatService
{
    protected $config = [
        'http' => [
            'verify'  => false,
            'timeout' => 5.0,
        ],

        'response_type' => 'array',
    ];

    /**
     * @var \EasyWeChat\OfficialAccount\Application
     */
    protected $app;

    /**
     * WechatService constructor.
     * @param array $config
     */
    public function __construct($config = [])
    {
        if (!$config) {
            $logic  = new SystemConfigLogic();
            $config = [
                'app_id'  => $logic->config('wechat_appid'),
                'secret'  => $logic->config('wechat_appsecret'),
                'token'   => $logic->config('wechat_appsecret'),
                'aes_key' => $logic->config('wechat_encodingaeskey'),
            ];
        }

        $this->config = array_merge_recursive($this->config, $config);

        $this->app = Factory::officialAccount($this->config);
    }

    public function __get($name)
    {
        return $this->app->{$name};
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->app, $name], $arguments);
    }
}
