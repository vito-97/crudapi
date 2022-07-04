<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/21
 * Time: 10:47
 */

namespace app\service;


use app\exception\ErrorException;
use think\captcha\Captcha;
use think\Config;
use think\facade\App;
use think\Session;

class CaptchaService extends Captcha
{
    protected $key;

    public function __construct(Config $config, Session $session, $key = '')
    {
        parent::__construct($config, $session);

        $this->key = $key;

        if (empty($this->key)) {
            throw new ErrorException('未设置KEY');
        }

        $this->session = App::getInstance()->invokeClass(CaptchaCacheService::class, [$key]);
    }

    public function check(string $code): bool
    {
        if (!$this->session->has('captcha')) {
            return false;
        }

        $value = $this->session->get('captcha');

        $key = $value ? $value['key'] ?? '' : '';

        $code = mb_strtolower($code, 'UTF-8');

        $res = password_verify($code, $key);

        if ($res) {
            $this->session->delete('captcha');
        }

        return $res;
    }
}