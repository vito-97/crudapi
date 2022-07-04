<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 14:57
 */

namespace app\common\payment;


interface PaymentInterface
{
    //支付
    public function pay($args = []);

    //扫码支付
    public function scanQrPay($args = []);

    //交易撤销
    public function cancel($args = []);

    //交易退款
    public function refund($args = []);

    //交易查询
    public function query($args = []);

    //订单关闭
    public function close($args = []);

    //订单通知
    public function notify($args = []);

    public function callback($args = []);

    //签名
    public function sign(array $params);

    //校验签名
    public function valid(array $params = []);

    //获取支付状态
    public function getPayStatus($status);

    //是否已经成功支付
    public function payIsSuccess($code);
}