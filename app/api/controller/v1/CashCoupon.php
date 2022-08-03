<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/1
 * Time: 9:41
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\common\ErrorCode;
use app\logic\CashCouponLogic;
use app\model\CashCouponCard;
use app\validate\CashCouponExistsValidate;

class CashCoupon extends BaseController
{
    protected function initialize()
    {
        $this->logic = new CashCouponLogic();
    }

    /**
     * 领取优惠券
     * @param int $id
     * @return array
     * @throws \app\exception\ValidateException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function receive($id = 0)
    {
        CashCouponExistsValidate::batchCheck();

//        $coupon = $this->logic->getModel()->find($id);

        $card = new CashCouponCard([
            'user_id'   => $this->uid(),
            'coupon_id' => $id,
        ]);

        $status = $card->save();

        if ($status) {
            return $this->success('领取成功');
        } else {
            return $this->error(ErrorCode::SERVICE_ERROR, '领取失败');
        }
    }
}
