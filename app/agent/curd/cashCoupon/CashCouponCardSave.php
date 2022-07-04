<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\cashCoupon;

use app\agent\curd\Save;
use app\model\CashCoupon;
use app\validate\CashCouponCardValidate;

class CashCouponCardSave extends Save
{
    //验证器
    protected $validate = [
        CashCouponCardValidate::class => 'save',
    ];
    //追加数据
    protected $appendParams = ['type' => CashCoupon::CASH_TYPE];
    //允许新增的数据字段
    protected $field = ['coupon_id', 'user_id', 'status'];

    protected $withUser = true;
}