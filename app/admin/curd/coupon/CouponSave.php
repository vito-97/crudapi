<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\coupon;

use app\common\curd\Save;
use app\common\Enum;
use app\model\Coupon;
use app\validate\CouponValidate;

class CouponSave extends Save
{
    //验证器
    protected $validate = [
        CouponValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['full_minus' => 0, 'type' => Coupon::COUPON_TYPE];
    //允许新增的数据字段
    protected $field = [];

    protected $withUser = true;
}