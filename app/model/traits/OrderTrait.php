<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/9
 * Time: 14:18
 */

namespace app\model\traits;


trait OrderTrait
{
    public function trade()
    {
        return $this->belongsTo('Order')->field($this->orderField ?? 'id,title,order_no,money,flow,price,pay_price,refund_money,status,pay_time,create_time');
    }
}