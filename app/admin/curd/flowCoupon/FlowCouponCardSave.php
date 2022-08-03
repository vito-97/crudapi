<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\flowCoupon;

use app\common\curd\Save;
use app\model\FlowCoupon;
use app\validate\FlowCouponCardValidate;

class FlowCouponCardSave extends Save
{
    //验证器
    protected $validate = [
        FlowCouponCardValidate::class => 'save',
    ];
    //追加数据
    protected $appendParams = ['type' => FlowCoupon::FLOW_TYPE];
    //允许新增的数据字段
    protected $field = ['coupon_id', 'user_id', 'status'];

    protected $withUser = true;

    protected function saveMiddleware($next, $params)
    {
        $coupon = FlowCoupon::find($params['coupon_id']);

        $params['agent_id']       = $coupon->agent_id;
        $params['coupon_user_id'] = $coupon->coupon_user_id;

        return $next($params);
    }
}
