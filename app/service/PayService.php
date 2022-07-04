<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/7
 * Time: 9:53
 */

namespace app\service;

use app\common\payment\driver\AllInPay;
use app\common\payment\Payment;
use app\logic\AllInPayLogic;

/**
 * Class PayLogic
 * @package app\logic
 * @mixin AllInPay
 */
class PayService
{
    protected $params = [];

    protected $driver;

    protected $domain;

    protected $payConfig = [];

    public function __construct($agentID)
    {
        AllInPayLogic::withScope(false);
        $this->payConfig = is_object($agentID) ? $agentID : (new AllInPayLogic())->getOne(['where' => ['agent_id'=>$agentID,'status' => \app\model\AllInPay::SWITCH_ON],'order' => ['id' => 'desc']]);
        $this->domain    = config('app.app_host') ?: true;
    }

    /**
     * 获取支付驱动
     * @return mixed|AllInPay
     */
    public function driver()
    {
        if (!$this->driver) {
            $this->driver = (new Payment([
                'public_key'  => $this->payConfig['public_key']??'',
                'private_key' => $this->payConfig['private_key']??'',
                'mch_id'      => $this->payConfig['cus_id']??'',
                'app_id'      => $this->payConfig['app_id']??'',
            ]))->driver();
        }
        return $this->driver;
    }

    /**
     * 合并参数
     * @param array $params
     * @return array
     */
    public function getParams($params = [])
    {
        $params = array_merge([
            'mch_id' => $this->payConfig['cus_id']??'',
            'app_id' => $this->payConfig['app_id']??'',
        ], $params);

        return $params;
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->driver(), $name], $arguments);
    }
}