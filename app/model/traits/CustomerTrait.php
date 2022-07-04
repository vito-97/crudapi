<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/27
 * Time: 16:58
 */

namespace app\model\traits;

use app\model\User;

trait CustomerTrait
{
    /**
     * 关联水务公司
     * @return \think\model\relation\BelongsTo
     */
    public function customer()
    {
        return $this->belongsTo('Customer', 'customer_id', 'id')->field($this->customerField ?? 'id,nickname,username,status');
    }
}