<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\coupon;

use app\common\curd\Save;
use app\validate\CouponCardValidate;

class CouponCardSave extends Save
{
    //验证器
    protected $validate = [
        CouponCardValidate::class => 'save',
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['coupon_id', 'user_id', 'status'];
}