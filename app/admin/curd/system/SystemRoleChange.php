<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Change;
use app\exception\DataInoperableException;
use think\Model;

class SystemRoleChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        if ($model->id == 1) {
            throw new DataInoperableException('超级管理员数据不可修改');
        }

        return parent::saveMiddleware($next, $model, $params);
    }
}