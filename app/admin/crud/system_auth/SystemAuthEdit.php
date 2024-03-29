<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_auth;

use app\admin\crud\Edit;
use app\exception\MessageException;
use app\admin\crud\system_role\SystemRoleTrait;

class SystemAuthEdit extends Edit
{
    use SystemRoleTrait;

    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = null;
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_module_enum' => ['name' => '模块', 'key' => 'module'],
    ];

    protected function editMiddleware($next, $model)
    {
        $ids = $this->getHasAuthId();

        if (is_array($ids) && !in_array($model->id, $ids)) {
            throw new MessageException('无权限获取');
        }

        return parent::editMiddleware($next, $model); // TODO: Change the autogenerated stub
    }
}
