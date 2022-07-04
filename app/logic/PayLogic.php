<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\common\EventName;
use app\common\Util;
use app\model\Order;
use app\service\PayService;
use think\facade\Db;
use think\facade\Event;

class PayLogic extends BaseLogic
{
    const NOTIFY_SUCCESS_RESPONSE = 'success';

    /**
     * 获取支付链接
     * @param $orderNo
     * @return array
     * @throws \app\exception\DataNotFoundException
     */
    public function pay($orderNo)
    {
        $url = $this->getPayUrl($orderNo);

        return ['pay_url' => $url];
    }

    /**
     * 获取支付链接
     * @param $orderNo
     * @param string $returnUrl
     * @param string $notifyUrl
     * @return string
     * @throws \app\exception\ErrorException
     * @throws \app\exception\DataNotFoundException
     */
    public function getPayUrl($orderNo, $returnUrl = '', $notifyUrl = '')
    {
        $order = $this->getOrder($orderNo);
        $order->checkCanPay();

        $payService = $this->payService($order->agent_id, $order);

        $query = [
//            'type' => config('web.payment.default'),
        ];
//        $returnUrl = $returnUrl ?: Util::url('/api/' . $this->API_VERSION . '/pay/callback', $query);
        $returnUrl = $returnUrl ?: client_url('pages/order/order');
        $notifyUrl = $notifyUrl ?: Util::url('/api/' . $this->API_VERSION . '/pay/notify', $query);

        $params = $payService->getParams([
            'order_no'   => $orderNo,
            'return_url' => $returnUrl,
            'notify_url' => $notifyUrl,
            'amount'     => $order->pay_amount,
            'body'       => $order->title,
        ]);

        $url = $payService->pay($params);

        return $url;
    }

    /**
     * 同步
     * @param $params
     * @return mixed
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ValidateException
     */
    public function callback($params)
    {
        $order      = $this->getOrder($params['reqsn'] ?? '');
        $payService = $this->payService($order->agent_id, $order);
        $result     = $payService->callback($params);
        //触发同步事件
        Event::trigger(EventName::PAY_CALLBACK, compact('order', 'result'));

        return $order;
    }

    /**
     * 异步通知
     * @param $params
     * @return string
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ValidateException
     */
    public function notify($params)
    {
        $order = $this->getOrder($params['outtrxid'] ?? '');

        $payService = $this->payService($order->agent_id, $order);
        $result     = $payService->notify($params);


        if ($payService->payIsSuccess($result)) {
            //触发支付成功事件
            if ($order->is_wait) {
                Db::transaction(function () use ($order, $result) {
                    Event::trigger(EventName::PAY_SUCCESS, compact('order', 'result'));
                });
            }
            return self::NOTIFY_SUCCESS_RESPONSE;
        }

        return 'fail';
    }

    public function refund($orderNo)
    {
        $order = $this->getOrder($orderNo);
        $order->checkCanRefund();


    }

    /**
     * 获取支付服务类
     * @param $agentID
     * @param array|object $order
     * @return PayService
     */
    public function payService($agentID, $order = '')
    {
        static $payService = [];

        //交服务费
        if ($order && $order->getData('type') == Order::SERVICE_CHARGE_TYPE) {
            $agentID = 0;
        }

        if (empty($payService[$agentID]))
            $payService[$agentID] = new PayService($agentID);

        return $payService[$agentID];
    }

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return 'order';
    }

    /**
     * 获取订单号
     * @param $orderNo
     * @return mixed
     * @throws \app\exception\DataNotFoundException
     */
    protected function getOrder($orderNo)
    {
        $orderLogic = new OrderLogic();
        $order      = $orderLogic->getOrderByNo($orderNo);

        return $order;
    }
}
