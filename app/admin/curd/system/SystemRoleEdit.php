<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Edit;
use app\logic\SystemAuthLogic;

class SystemRoleEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = null;
    //追加字段
    protected $append = ['auth'];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_auth_label' => ['name' => '权限', 'key' => 'auth'],
    ];

    public function getAuthLabel()
    {
        $logic = new SystemAuthLogic();

        $args = [
            'field' => ['id', 'name', 'route'],
            'where' => ['module' => 'admin'],
            'scope' => ['status'],
            'limit' => 0,
        ];

        return $logic->getAll($args);
    }
}