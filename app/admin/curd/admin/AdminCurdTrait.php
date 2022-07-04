<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 14:53
 */

namespace app\admin\curd\admin;


use app\logic\SystemRoleLogic;

trait AdminCurdTrait
{
    /**
     * 获取角色列表
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\Paginator
     */
    public function getRoleLabel()
    {
        $logic = new SystemRoleLogic();
        $result = $logic->getRoleLabel();

        return $result;
    }
}