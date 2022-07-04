<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 14:57
 */

namespace app\service;


use EasyWeChat\Factory;

/**
 * @mixin \EasyWeChat\OfficialAccount\Application
 * Class WechatService
 * @package app\service
 */
class WechatService
{
    protected $config = [
        'http'          => [
            'verify' => false,
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
        $config = $config ?: site('wechat');

        $this->config = array_merge_recursive($this->config, $config);

        $this->app = Factory::officialAccount($this->config);
    }

    public function __get($name)
    {
        return $this->app->$name;
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->app, $name], $arguments);
    }
}