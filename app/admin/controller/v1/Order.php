<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\common\EventName;
use app\exception\DataNotFoundException;
use app\exception\MessageException;
use app\logic\OrderLogic;
use think\facade\Event;

class Order extends BaseController
{
    protected $name = '订单';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected $methodName = [
        'refund' => '退款',
    ];

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
    public function refund($id = 0, $mark = '', $refundMoney = 0)
    {
        /**
         * @var $order \app\model\Order
         */
        $order = $this->logic->getByID($id);

        if (!$order) {
            throw new DataNotFoundException();
        }

        $canRefundMoney = bcsub($order->pay_price, $order->refund_amount, 2);

        if ($refundMoney <= 0) {
            $refundMoney = $canRefundMoney;
        }

        if (!$order->is_pay && !$order->is_refund) {
            throw new MessageException('订单状态错误');
        }

        if ($order->pay_price <= $order->refund_amount) {
            throw new MessageException('订单金额已全部退还');
        }

        if ($refundMoney > $canRefundMoney) {
            throw new MessageException('退款金额不能大于' . $canRefundMoney . '元');
        }

        // 待退款事件
        Event::trigger(EventName::ORDER_WAIT_REFUND, ['order' => $order, 'refund_money' => $refundMoney, 'refund_mark' => $mark]);

        return $this->success('申请退款成功');
    }
}
