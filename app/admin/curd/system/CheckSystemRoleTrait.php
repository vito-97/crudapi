<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 9:45
 */

namespace app\admin\curd\system;


use app\exception\DataInoperableException;

trait CheckSystemRoleTrait
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
     * 是否有权限删除角色
     * @param $model
     * @return bool
     */
    protected function hasRoleToDo($model)
    {
        $role   = $this->user->getUserInfo()->role;
        $userID = $this->user->uid();

        if (!$role->isSuper()) {
            return $model->admin_id == $userID;
        }

        return true;
    }

    protected function getHasAuthId()
    {
        $role = $this->user->getUserInfo()->role;

        if (!$role->isSuper()) {
            return $role->auth_ids_array;
        }

        return true;
    }
}