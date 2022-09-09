<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/7
 * Time: 11:32
 */

namespace app\admin\curd\system_log;


trait SystemLogTrait
{
    public function withUser($model)
    {
        if ($model->isAdminModule()) {
            $model->admin;
        } else {
            $model->user;
        }

        return $model;
    }
}
