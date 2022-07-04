<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/22
 * Time: 9:33
 */

namespace app\service;


use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use think\facade\Config;

class JwtAuthService
{
    protected static $alg = 'HS256';

    /**
     * jwt 加密
     * @param array $playload
     * @return string
     */
    public static function encode($playload = [])
    {
        return JWT::encode($playload, self::getKey(), self::$alg);
    }

    /**
     * jwt 解密
     * @param $string
     * @return object
     */
    public static function decode($string)
    {
        return JWT::decode($string, new Key(self::getKey(), self::$alg));
    }

    protected static function getKey()
    {
        return Config::get('salt.jwt');
    }
}