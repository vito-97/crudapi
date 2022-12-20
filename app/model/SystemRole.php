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
     * 写入之前事件
     * @param Model $model
     * @return mixed|void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function onBeforeWrite(Model $model)
    {
        $pid = $model->pid ?? 0;

        if ($pid) {
            $parent          = self::where('id', $pid)->find();
            //添加的权限只能是上级有的权限
            $model->auth_ids = array_intersect($parent->auth_ids_array, $model->auth_ids_array);
        }
    }

    /**
     * 更新之后事件
     * @param Model $model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function onAfterUpdate(Model $model): void
    {
        self::checkChildAuth($model);
    }

    /**
     * 检测下级分类是否有越权的权限
     * @param $model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function checkChildAuth($model)
    {
        $id   = $model->id;
        $auth = $model->auth_ids_array;

        //获取下级角色
        $result = self::where('pid', $id)->select();

        foreach ($result as $item) {
            //获取交集
            $allowId = array_intersect($auth, $item->auth_ids_array);
            //交集权限的数量和之前的权限的数量不一样
            if (count($allowId) !== count($item->auth_ids_array)) {
                $item->auth_ids = $allowId;
                $item->save();
            }
        }
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