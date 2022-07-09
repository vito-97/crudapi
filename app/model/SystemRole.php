<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:30
 */

namespace app\model;

use app\common\Util;
use app\model\traits\TreeTrait;
use think\db\Query;
use think\Model;

class SystemRole extends BaseModel
{
    use TreeTrait;

    protected $hidden = ['delete_time'];

    protected $superAdmin = 'admin';

    /**
     * 判断是否为超级管理员
     * @return bool
     */
    public function isSuper()
    {
        return $this->getData('key') === $this->superAdmin;
    }

    /**
     * 删除事件
     * @param Model $model
     */
    public static function onAfterDelete(Model $model): void
    {
        //将所有子类也删除
        self::destroy(['pid' => $model->id]);
    }

    /**
     * 权限获取器
     * @return array
     */
    protected function getAuthAttr()
    {
        $result = $this->getAuth(app()->http->getName());

        return $result;
    }

    /**
     * 获取树形
     * @return array
     */
    protected function getAuthTreeAttr()
    {
        $result = $this->getAuth(app()->http->getName());

        return Util::tree($result);
    }

    /**
     * 获取所有权限
     * @param string $module
     * @param array $append
     * @return array
     */
    public function getAuth($module = '', $append = [])
    {
        static $auth = [];

        if (empty($auth[$this->id])) {
            $auth[$this->id] = (new SystemAuth())->getAuth($this, $module, $append)->toArray();
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

    /**
     * 获取权限ID数组
     * @return array|false|string[]
     */
    protected function getAuthIdsArrayAttr()
    {
        $ids = $this->getData('auth_ids');

        return $ids ? explode(',', $ids) : [];
    }

    /**
     * 权限ID修改器
     * @param $value
     * @return string
     */
    protected function setAuthIdsAttr($value)
    {
        return $this->setArrayToStringAttr($value);
    }

    /**
     * 列表搜索器
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('name|key', 'like', '%' . $value . '%');
    }
}