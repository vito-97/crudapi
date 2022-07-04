<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\coupon;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\CouponValidate;

class CouponUpdate extends Update
{
    //验证器
    protected $validate = [
        CouponValidate::class => Enum::VALID_UPDATE_SCENE
    ];
    //允许新增的数据字段
    protected $field = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $withUser = true;
}