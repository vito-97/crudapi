<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\cashCoupon;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\CashCouponValidate;

class CashCouponUpdate extends Update
{
    //验证器
    protected $validate = [
        CashCouponValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}