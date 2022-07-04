<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/6
 * Time: 14:02
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\logic\PayLogic;
use app\validate\PayValidate;
use think\facade\Log;

class Pay extends BaseController
{
    const NOT_NEED_LOGIN = ['notify', 'callback'];

    protected $name = '支付';

    protected $methodName = [
        'pay'      => '支付',
        'notify'   => '异步通知',
        'callback' => '同步通知',
        'refund'   => '退款',
    ];

    protected $log = true;

    protected function initialize()
    {
        $this->logic = new PayLogic();
    }

    /**
     * 支付
     * @param string $orderNo
     * @return array
     * @throws \app\exception\ValidateException
     */
    public function pay($orderNo = null)
    {
        PayValidate::batchCheck('order');

        $response = $this->logic->pay($orderNo);

        return success($response);
    }

    /**
     * 支付异步回调
     * @return string
     */
    public function notify()
    {
        $params = $this->getParams();
        if ($this->log)
            Log::write('支付异步回调' . json_encode($params));

        $response = $this->logic->notify($params);

        return $response;
    }

    //同步回调
    public function callback()
    {

        $params = $this->getParams();

        if ($this->log)
            Log::write('支付同步回调' . json_encode($params));

        $order  = $this->logic->callback($params);
        $device = $order->device;
        $query  = ['order_no' => $order->order_no];
        $url    = client_url('pages/order/order', $query);

//        return redirect($url);
        return "<div>跳转中...</div><script>location.href = '{$url}';</script>";
    }

    public function refund($orderNo = null)
    {
        PayValidate::batchCheck('order');

        $status = $this->logic->refund($orderNo);
    }
}