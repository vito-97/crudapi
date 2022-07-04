<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\cashCoupon;

use app\coupon_user\curd\Update;
use app\common\Enum;
use app\validate\CashCouponValidate;

class CashCouponUpdate extends Update
{
    //验证器
    protected $validate = [
        CashCouponValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = [
        'name', 'limit', 'limit_type', 'status',
    ];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}