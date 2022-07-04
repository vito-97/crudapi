<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/17
 * Time: 10:23
 */

namespace app\model\traits;


trait RoleTrait
{
    /**
     * 关联权限
     * @return \think\model\relation\BelongsTo
     */
    public function role()
    {
        return $this->belongsTo('SystemRole','role_id','id');
    }
}