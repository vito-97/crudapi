<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/9
 * Time: 14:27
 */

namespace app\model\traits;


trait ProductTrait
{
    /**
     * 关联套餐
     * @return \think\model\relation\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo('Product')->field($this->productField ?? 'id,name,price,money,flow,give_flow,status,is_vip,create_time');
    }
}