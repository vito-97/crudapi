<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\validate;

class CashCouponValidate extends CouponValidate
{
    protected $scene = [
        self::SAVE_SCENE   => ['name', 'amount', 'total', 'is_infinite', 'get_start_time', 'get_end_time', 'use_start_time', 'use_end_time', 'coupon_day', 'sort', 'status', 'limit', 'get_time', 'use_time'],
        self::UPDATE_SCENE => ['name', 'amount', 'total', 'is_infinite', 'get_start_time', 'get_end_time', 'use_start_time', 'use_end_time', 'coupon_day', 'sort', 'status', 'limit', 'get_time', 'use_time'],

        self::LIST_SCENE => ['status', 'coupon_user_id', 'is_infinite'],
    ];
}