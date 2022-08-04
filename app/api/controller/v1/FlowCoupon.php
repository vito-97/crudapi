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
use app\exception\MessageException;
use app\logic\FlowCouponLogic;
use app\model\FlowCouponCard;
use app\validate\FlowCouponExistsValidate;

class FlowCoupon extends BaseController
{
    protected $registerCurd = ['read'];
    protected $registerCurdDir = 'coupon';

    protected function initialize()
    {
        $this->logic = new FlowCouponLogic();
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
        FlowCouponExistsValidate::batchCheck();

        $user = $this->user->getUserInfo();

        if ($user->platform != \app\model\User::WX_PLATFORM) {
            throw new MessageException('请用微信扫码进入领取');
        }

        $card = new FlowCouponCard([
            'user_id'   => $this->uid(),
            'coupon_id' => $id,
        ]);

        $status = $card->save();

        if ($status) {
            $user->flow = ['inc', (int)$card->coupon->amount];
            $user->save();

            return $this->success('领取成功');
        } else {
            return $this->error(ErrorCode::SERVICE_ERROR, '领取失败');
        }
    }
}
