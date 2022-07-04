<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\order;

use app\admin\curd\order\OrderTrait;
use app\waterworks\curd\Save;
use app\common\Enum;
use app\logic\CouponCardLogic;
use app\logic\ProductLogic;
use app\model\Order;
use app\validate\OrderValidate;

class OrderSave extends Save
{
    use OrderTrait;

    //验证器
    protected $validate = [
        OrderValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['coupon_card_id' => 0, 'type' => Order::SERVICE_CHARGE_TYPE];
    //允许新增的数据字段
    protected $field = [];

    protected $middleware = ['queryMiddleware'];

    protected $saveMiddleware = ['saveMiddleware'];

    protected $product;

    protected $couponCard;

    protected $withUser = true;

    protected function queryMiddleware($next)
    {
        $this->checkCoupon();

        return $next();
    }

    protected function checkCoupon()
    {
        $couponID  = $this->request->param('coupon_card_id');
        $productID = $this->request->param('product_id');
        $product   = null;
        if ($productID) {
            $this->product = $product = (new ProductLogic())->getProductByID($productID);
        }
        if ($couponID) {
            $logic            = new CouponCardLogic();
            $this->couponCard = $detail = $logic->getCouponCardByID($couponID, $this->request->param('user_id'));
            $detail->checkCanUse($product);
        }
    }

    /**
     * 保存之前可对数据进行修改
     * @param $next
     * @param array $params
     * @return mixed
     */
    protected function saveMiddleware($next, $params)
    {
        $product = $this->product;
        $price   = $payPrice = $product->price;
        if ($this->couponCard) {
            $payPrice = $this->couponCard->coupon->subMoney($payPrice);
        }
        if (empty($params['title'])) {
            $params['title'] = $product['name'];
        }
        if (empty($params['money'])) {
            $params['money'] = $product->money;
        }
        if (empty($params['flow'])) {
            $params['flow'] = $product->flow;
        }
        if (empty($params['price'])) {
            $params['price'] = $price;
        }
        if (empty($params['pay_price'])) {
            $params['pay_price'] = $payPrice;
        }
        if ($params['pay_price'] <= 0) {
            $params['pay_price'] = 0.01;
        }

        $params['is_recharged'] = 0;
        $params['type']         = Order::RECHARGE_TYPE;
        $params['product_snap'] = $product->visible(['name', 'price', 'flow', 'give_flow', 'allow_refund', 'is_vip'])->toJson();
        $params['is_vip']       = $product->is_vip;
        $params['allow_refund']   = $product->allow_refund;//判断是否可以退款

        $response = $next($params);

        if ($response) {
            //判断是否可以充值
            //触发支付事件
            $this->triggerOrderEvent($response);
        }
        return $response;
    }
}