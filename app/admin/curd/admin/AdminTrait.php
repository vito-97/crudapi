<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 16:10
 */

namespace app\admin\curd\admin;

use app\exception\MessageException;
use app\logic\SystemRoleLogic;

trait AdminTrait
{
    /**
     * 判断是否为超级管理员
     * @param $model
     * @return bool
     */
    protected function isSuperAdmin($model)
    {
        return (int)$model->id === 1;
    }

    /**
     * 当前登录角色是否有权限设置传入的角色
     * @param $roleID
     * @return $this
     * @throws MessageException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function canSetRole($roleID)
    {
        if ($roleID) {
            $userRole = $this->getUserRole();

            if (!$userRole->isSuper()) {
                $logic = new SystemRoleLogic();
                $role  = $logic->find($roleID);

                //设置了不存在的角色
                if (!$role) {
                    throw new MessageException('角色不存在');
                }

                //不能越权设置其他角色
                if ($role->pid != $userRole->id) {
                    throw new MessageException('没有权限设置其他角色');
                }
            }
        }

        return $this;
    }
}