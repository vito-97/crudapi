<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;


class SystemAuth extends BaseModel
{
    protected $hidden = ['delete_time'];

    protected $append = [];

    protected $moduleEnum = [
        'api'         => '接口',
        'admin'       => '后台',
        'agent'       => '运营商',
        'coupon_user' => '商户',
        'repair_user' => '运营商维护员',
    ];

    /**
     * 获取权限集合
     * @param $role
     * @param array $append
     * @return SystemAuth
     */
    public function getAuth($role, $append = [])
    {
        $where = [];

        if (!$role->isSuper()) {
            $where[] = ['id', 'IN', $role->ids_array];
        }
        $field = array_merge(['id', 'name', 'route', 'url'], $append);
        return $this->where($where)->field($field)->select();
    }

    /**
     * 获取菜单
     * @param $role
     * @param $module
     * @return SystemAuth[]|array|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getMenu($role, $module)
    {
        $where = [
            ['module', '=', $module],
            ['is_menu', '=', 1],
            ['status', '=', 1],
        ];

        if (!$role->isSuper()) {
            $where[] = ['id', 'IN', $role->ids_array];
        }

        $result = $this->field(['id', 'name', 'route', 'icon', 'url', 'pid'])->where($where)->order('sort', 'asc')->select();

        return $result;
    }
}