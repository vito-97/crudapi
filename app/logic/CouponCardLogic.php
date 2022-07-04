<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:36
 */

namespace app\logic;

use app\exception\DataNotFoundException;
use app\model\CouponCard;

class CouponCardLogic extends BaseLogic
{
    protected function getModelName()
    {
        return CouponCard::class;
    }

    /**
     * 获取优惠券
     * @param $id
     * @param int $user_id
     * @return \app\model\BaseModel|array|mixed|\think\Model
     * @throws DataNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getCouponCardByID($id, $user_id = 0)
    {
        $args = [
            'scope' => [
                'status',
            ],
            'where' => ['user_id' => $user_id],
        ];

        $detail = $this->getModel()->getByID($id, $args);

        if (!$detail) {
            throw new DataNotFoundException('优惠券不存在');
        }

        return $detail;
    }

    /**
     * 统计领取的数量
     * @param $couponID
     * @param $userID
     * @param array|string $time
     * @return int
     */
    public function countByUserID($couponID, $userID, $time = '')
    {
        $where = ['user_id' => $userID, 'coupon_id' => $couponID];
        $query = $this->getModel()->where($where);

        if ($time) {
            $query = $query->whereTime('create_time', $time);
        }

        return $query->count();
    }
}