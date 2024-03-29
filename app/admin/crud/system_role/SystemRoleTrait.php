<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 9:45
 */

namespace app\admin\crud\system_role;


use app\exception\DataInoperableException;
use app\exception\MessageException;
use app\logic\AdminLogic;
use app\logic\SystemRoleLogic;
use think\facade\Db;

trait SystemRoleTrait
{
    /**
     * 禁止删除超管角色
     * @param $model
     * @return $this
     * @throws DataInoperableException
     */
    protected function disabledModifySuperAdmin($model)
    {
        if ($model->isSuper()) {
            throw new DataInoperableException('超级管理员数据不可修改');
        }

        return $this;
    }

    /**
     * 判断是否可以删除角色
     * @param $model
     * @return $this
     * @throws MessageException
     */
    protected function canDelete($model)
    {
        $id         = $model->id;
        $adminLogic = new AdminLogic();

        //获取所有下级的ID
        $ids = $this->getLogic()->getChildrenID($id, true);

        $count = $adminLogic->where('role_id', 'IN', $ids)->count();

        if ($count) {
            throw new MessageException(sprintf('该角色%s共有%d个管理员，请将该角色的管理员更换成其他角色才能删除', count($ids) > 1 ? '以及下级角色' : '', $count));
        }

        return $this;
    }

    /**
     * 是否有权限删除角色
     * @param $model
     * @return bool
     */
    protected function hasRoleToDo($model)
    {
        $role = $this->getUserRole();

        $userID = $this->user->uid();

        if (!$role->isSuper()) {
            return $model->admin_id == $userID;
        }

        return true;
    }

    /**
     * 获取自身有的权限ID集合
     * @return bool|array
     */
    protected function getHasAuthId()
    {
        $role = $this->getUserRole();

        if (!$role->isSuper()) {
            return $role->auth_ids_array;
        }

        return true;
    }
}
