<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/9
 * Time: 16:15
 */

namespace app\model\traits;


trait RepairUserTrait
{
    public function repairUser()
    {
        return $this->belongsTo('User')->field($this->repairUserField ?? 'id,username,nickname');
    }
}