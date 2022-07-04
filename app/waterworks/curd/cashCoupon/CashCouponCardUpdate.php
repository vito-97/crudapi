<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\cashCoupon;

use app\waterworks\curd\Update;
use app\common\Enum;
use app\validate\CashCouponCardValidate;
use app\validate\CouponCardValidate;

class CashCouponCardUpdate extends Update
{
    //验证器
    protected $validate = [
        CashCouponCardValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['status'];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}