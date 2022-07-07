<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:30
 */

namespace app\model;


class SystemRole extends BaseModel
{
    protected $hidden = ['create_time', 'update_time', 'delete_time'];

    protected $superAdmin = 'admin';

    /**
     * 判断是否为超级管理员
     * @return bool
     */
    public function isSuper()
    {
        return $this->getData('key') === $this->superAdmin;
    }

    protected function getAuthAttr()
    {
        return $this->getAuth();
    }

    public function getAuth($append = [])
    {
        static $auth = [];

        if (empty($auth[$this->id])) {
            $auth[$this->id] = (new SystemAuth())->getAuth($this, $append)->toArray();
        }

        return $auth[$this->id];
    }

    /**
     * 获取菜单
     * @param string $module 模块的菜单
     * @return mixed
     */
    public function getMenu($module)
    {
        static $menu = [];

        if (empty($menu[$this->id])) {
            $result = (new SystemAuth())->getMenu($this, $module);
            if ($result) {
                $result = $result->toArray();
            }
            $menu[$this->id] = $result ?: [];
        }

        return $menu[$this->id];
    }

    protected function getIdsArrayAttr()
    {
        $ids = $this->getData('auth_ids');

        return $ids ? explode(',', $ids) : [];
    }

    protected function setAuthIdsAttr($value)
    {
        return $this->setArrayToStringAttr($value);
    }
}