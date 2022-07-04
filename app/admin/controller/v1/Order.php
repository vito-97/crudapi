<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\exception\DataNotFoundException;
use app\exception\MessageException;
use app\logic\OrderLogic;

class Order extends BaseController
{
    protected $name = '订单';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected function initialize()
    {
        $this->logic = new OrderLogic();
    }

    /**
     * 退款
     * @param int $id
     * @param int $mark
     * @return array
     * @throws DataNotFoundException
     * @throws MessageException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function refund($id = 0, $mark = '')
    {
        /**
         * @var $order \app\model\Order
         */
        $order = $this->logic->getByID($id);

        if (!$order) {
            throw new DataNotFoundException();
        }

        if (!$order->is_pay) {
            throw new MessageException('订单状态错误');
        }

        $order->status      = \app\model\Order::STATUS_WAIT_REFUND;
        $order->refund_mark = $mark;
        $order->save();

        return $this->success('申请退款成功');
    }
}
