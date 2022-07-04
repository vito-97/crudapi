<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/31
 * Time: 17:23
 */

namespace app\model\traits;


trait UserTrait
{
    public function user()
    {
        return $this->belongsTo('Member')->field($this->userField ?? 'id,username,nickname,money,flow,pay_count,type,user_id');
    }
}