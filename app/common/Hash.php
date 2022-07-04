<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 17:20
 */

namespace app\common;

use \think\facade\Config;

class Hash
{
    protected static $defaultSalt = 'password';

    const PASSWORD_SALT_KEY = 'password';

    /**
     * 加密
     * @param $string
     * @param null $salt
     * @return string
     */
    public static function encode($string, $salt = null)
    {
        $s = self::getSalt($salt);

        return md5($s . $string . $s);
    }

    /**
     * 验证传入的未加密字符串和已加密的字符串是否一致
     * @param $string
     * @param $hash
     * @param null $salt
     * @return bool
     */
    public static function validate($string, $hash, $salt = null)
    {
        $stringHash = self::encode($string, $salt);

        return $stringHash === $hash;
    }

    /**
     * 加密密码类型
     * @param $string
     * @return string
     */
    public static function encodePassword($string)
    {
        return self::encode($string, self::PASSWORD_SALT_KEY);
    }

    /**
     * 验证密码类型
     * @param $string
     * @param $hash
     * @return bool
     */
    public static function validatePassword($string, $hash)
    {
        return self::validate($string, $hash, self::PASSWORD_SALT_KEY);
    }

    /**
     * 获取加密盐
     * @param $salt
     * @return mixed
     */
    protected static function getSalt($salt)
    {
        $salt = $salt ?? self::$defaultSalt;

        $s = Config::get('salt.' . $salt, $salt);

        return $s;
    }
}