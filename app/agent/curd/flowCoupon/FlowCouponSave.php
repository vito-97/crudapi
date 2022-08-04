<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\flowCoupon;

use app\common\curd\Save;
use app\common\Enum;
use app\model\CashCoupon;
use app\validate\CashCouponValidate;
use app\validate\FlowCouponValidate;

class FlowCouponSave extends Save
{
    //验证器
    protected $validate = [
        FlowCouponValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //追加数据
    //追加数据
    protected $appendParams = ['name' => '', 'type' => CashCoupon::FLOW_TYPE, 'full_minus' => 0];
    //允许新增的数据字段
    protected $field = [
        'name', 'amount', 'total', 'issued_total',
        'is_infinite', 'get_start_time', 'get_end_time',
        'use_start_time', 'use_end_time', 'coupon_day',
        'limit', 'sort', 'status',
        'coupon_user_id', 'limit_type',
    ];

    protected $withUser = 'agent_id';
}
