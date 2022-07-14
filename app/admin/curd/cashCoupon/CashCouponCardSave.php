<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\cashCoupon;

use app\common\curd\Save;
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

    protected function saveMiddleware($next, $params)
    {
        $coupon = CashCoupon::find($params['coupon_id']);

        $params['agent_id']       = $coupon->agent_id;
        $params['coupon_user_id'] = $coupon->coupon_user_id;

        return $next($params);
    }
}