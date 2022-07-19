<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:15
 */

namespace app\agent\controller\v1;


use app\agent\controller\BaseController;
use app\common\Util;
use app\exception\MessageException;
use app\exception\SaveDataErrorException;
use app\logic\OrderLogic;
use app\logic\PayLogic;
use app\validate\IDMustBeIntArrayValidate;
use app\validate\OrderValidate;
use app\validate\PaginateValidate;
use app\validate\PayValidate;
use app\validate\TimeTypeValidate;

class Order extends BaseController
{
    protected $name = '订单';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    const NOT_NEED_LOGIN = ['callback'];

    protected function initialize()
    {
        $this->logic = new OrderLogic();
    }

    public function history($page = 1, $limit = 0, $type = 'day')
    {
        TimeTypeValidate::batchCheck(['type' => $type]);
        PaginateValidate::batchCheck();

        $limit       = $this->getHistoryLimit($limit, $type);
        $countMethod = 'countOrderListBy' . ucfirst($type);
        $moneyMethod = 'sumMoneyListBy' . ucfirst($type);
        $args        = ['page' => $page];
        $count       = $this->logic->$countMethod($limit, $args);
        $money       = $this->logic->$moneyMethod($limit, $args);

        $result = $count;

        foreach ($result['list'] as $key => $item) {
            $result['list'][$key] = [
                'count' => $item,
                'money' => $money['list'][$key],
            ];
        }

        return $this->success($result);
    }

    /**
     * 获取详情
     * @param null $orderNo
     * @return array
     * @throws \app\exception\ValidateException
     */
    public function detail($orderNo = null)
    {
        OrderValidate::batchCheck('detail');

        $detail = $this->logic->getOrderByNo($orderNo)->scene('api');

        $this->checkOrderIsServiceCharge($detail);

        $response = [
            'detail' => $detail,
        ];

        return success($response);
    }

    /**
     * 获取状态
     * @param null $orderNo
     * @return array
     * @throws \app\exception\ValidateException
     */
    public function status($orderNo = null)
    {
        OrderValidate::batchCheck('detail');

        $detail = $this->logic->getOrderStatus($orderNo)->scene('status');

        $this->checkOrderIsServiceCharge($detail);

        $response = [
            'detail' => $detail,
        ];

        return success($response);
    }

    /**
     * 创建支付订单
     * @param string $serviceChargeId
     * @return array
     * @throws SaveDataErrorException
     * @throws \app\exception\ValidateException
     */
    public function create($serviceChargeId = '')
    {
        IDMustBeIntArrayValidate::batchCheck(['id' => $serviceChargeId]);

        $order = $this->logic->createAgentPayOrder($this->uid(), $serviceChargeId);

        if ($order) {
            $order->pay_url = $this->getPayUrl($order->order_no);
            return $this->success($order);
        } else {
            throw new SaveDataErrorException('生成订单失败');
        }
    }

    /**
     * 获取支付链接
     * @param string $orderNo
     * @return array
     * @throws MessageException
     * @throws \app\exception\ValidateException
     */
    public function pay($orderNo = '')
    {
        PayValidate::batchCheck('order');

        $response = ['pay_url' => $this->getPayUrl($orderNo)];

        return $this->success($response);
    }

//同步回调
    public function callback()
    {

        $params = $this->getParams();

//        Log::write('支付同步回调' . json_encode($params));
        \app\model\Order::withScope(false);
        $pay    = new PayLogic();
        $order  = $pay->callback($params);
        $device = $order->device;
        $query  = ['order_no' => $order->order_no];

        $url = client_url('pages/order/callback', $query, 'agent_host');
        return redirect($url);
    }

    /**
     * 获取支付链接
     * @param string $orderNo
     * @return string
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ErrorException
     */
    protected function getPayUrl($orderNo = '')
    {
        $payLogic = new PayLogic();

        $url = Util::url('/agent/v1/order/callback');
        return $payLogic->getPayUrl($orderNo, $url);
    }

    /**
     * 检测订单是否为服务费订单
     * @param $order
     * @return $this
     * @throws MessageException
     */
    protected function checkOrderIsServiceCharge($order)
    {
        if ($order->user_id != $this->uid()) {
            throw new MessageException('订单信息错误');
        }

        return $this;
    }
}