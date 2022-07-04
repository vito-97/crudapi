<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/6
 * Time: 15:16
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\exception\MessageException;
use app\logic\DeviceControlLogic;
use app\logic\OrderLogic;
use app\logic\PayLogic;
use app\logic\ProductLogic;
use app\model\DeviceControl;
use app\validate\DeviceValidate;
use app\validate\OrderValidate;

class Order extends BaseController
{
    protected $name = '订单';

    protected $methodName = [
        'create' => '生成订单',
        'detail' => '订单详情',
        'status' => '订单状态',
    ];

    protected function initialize()
    {
        $this->logic = new OrderLogic();
    }

    /**
     * 创建订单
     * @return array
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ErrorException
     * @throws \app\exception\ValidateException
     */
    public function create()
    {
        //验证器
        OrderValidate::batchCheck('create');
        $params = OrderValidate::getDataByRule('create');

        //创建订单
        $order = $this->logic->createOrder($params);

        $orderNo = $order->order_no;
        //获取支付链接
        $pay    = new PayLogic();
        $payUrl = $pay->getPayUrl($orderNo);

        $response = [
            'order_no' => $orderNo,
            'pay_url'  => $payUrl,
        ];

        return success($response, '创建订单成功');
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

        $order = $this->logic->getOrderByNo($orderNo)->scene('api');

        $response = [
            'detail' => $order,
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

        $status = $this->logic->getOrderStatus($orderNo)->scene('status');

        $response = [
            'detail' => $status,
        ];

        return success($response);
    }
}