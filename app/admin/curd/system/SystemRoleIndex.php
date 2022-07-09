<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Index;

class SystemRoleIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [['pid', '=', 0]];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $with = ['children'];

    protected $append = ['auth_tree'];

//    protected $format = 'tree';

    /**
     * 三级类初始化
     */
    protected function init($next)
    {
        $map = [];

        $role = $this->user->getUserInfo()->role;

        //非超管只能获取自己添加的角色
        if (!$role->isSuper()) {
            $map[] = ['admin_id', '=', $this->user->uid()];
        }

        $this->where = array_merge($this->where, $map);
        $response    = $next();
        return $response;
    }
}