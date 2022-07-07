<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:43
 */

namespace app\model\traits;


use app\common\Hash;

trait LoginTrait
{
    use IpTrait;
    /**
     * 上次登录时间格式
     * @var string
     */
    protected $lastLoginTimeFormat = 'Y-m-d H:i:s';

    /**
     * 设置上次登录ip
     * @param $value
     * @return false|int|mixed|string
     */
    public function setLastLoginIpAttr($value)
    {
        return $this->_setIpAttr($value);
    }

    /**
     * 设置上次登录时间
     * @param $value
     * @return false|int|mixed|string
     */
    public function setLastLoginTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    /**
     * 获取上次登录ip
     * @param $value
     * @return mixed|string
     */
    public function getLastLoginIpAttr($value)
    {
        return $this->_getIpAttr($value);
    }

    /**
     * 获取上次登录时间
     * @param $value
     * @return false|mixed|string
     */
    public function getLastLoginTimeAttr($value)
    {
        return $this->_getTimeAttr($value, $this->lastLoginTimeFormat);
    }

    /**
     * 设置添加IP
     * @param $value
     * @return false|int|mixed|string
     */
    public function setAddIpAttr($value)
    {
        return $this->_setIpAttr($value);
    }

    /**
     * 获取添加IP
     * @param $value
     * @return mixed|string
     */
    public function getAddIpAttr($value)
    {
        return $this->_getIpAttr($value);
    }

    /**
     * 设置密码
     * @param $value
     * @return string|null
     */
    public function setPasswordAttr($value)
    {
        if ($value) {
            return Hash::encodePassword($value);
        } else {
            unset($this->password);
        }

        return null;
    }
}