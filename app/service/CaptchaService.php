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

    /**
     * 生成验证码字符串
     * @return array
     * @throws \Exception
     */
    protected function generate(): array
    {
        $bag = '';

        if ($this->math) {
            $this->useZh  = false;
            $this->length = 5;

            $x   = random_int(10, 30);
            $y   = random_int(1, 9);
            $bag = "{$x} + {$y} = ";
            $key = $x + $y;
            $key .= '';
        } else {
            if ($this->useZh) {
                $characters = preg_split('/(?<!^)(?!$)/u', $this->zhSet);
            } else {
                $characters = str_split($this->codeSet);
            }

            for ($i = 0; $i < $this->length; $i++) {
                $bag .= $characters[rand(0, count($characters) - 1)];
            }

            $key = mb_strtolower($bag, 'UTF-8');
        }

        $hash = password_hash($key, PASSWORD_BCRYPT, ['cost' => 10]);
        $this->session->set('captcha', [
            'key' => $hash,
        ]);

        return [
            'value' => $bag,
            'key'   => $hash,
        ];
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
