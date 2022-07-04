<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\common\payment\driver\AllInPay;
use app\common\payment\Payment;
use think\helper\Str;

class AllInPayValidate extends BaseValidate
{
    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'        => 'require|max:20',
        'app_id'      => 'require|max:20|unique:all_in_pay',
        'cus_id'      => 'require|max:20|unique:all_in_pay',
        'private_key' => 'require|max:2000',
        'public_key'  => 'require|max:500|checkPayKey',
        'agent_id'    => 'require|isPositiveInteger:zero',
    ];

    /**
     * 字段对应的名称
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name => valid_field.name 或 name => name_alias
     * @var array
     */
    protected $field = [

    ];

    /**
     * 验证消息
     * 可设置语言包字段 无分组
     * @var array
     */
    protected $message = [
        'public_key.checkPayKey' => '公钥和私钥错误',
    ];

    /**
     * 验证场景
     * @var array
     */
    protected $scene = [
        'save'   => ['name', 'app_id', 'cus_id', 'private_key', 'public_key', 'agent_id'],
        'update' => ['name', 'app_id', 'cus_id', 'private_key', 'public_key', 'agent_id'],
    ];

    /**
     * 校验私钥和公钥是否正确
     * @param $value
     * @param string $rule
     * @param array $data
     * @return bool
     */
    public function checkPayKey($value, $rule = '', $data = [])
    {
        if(isset($data['public_key']) && isset($data['private_key']) && isset($data['app_id']) && isset($data['cus_id'])){
            /**
             * @var AllInPay $pay
             */
            $pay = (new Payment($data))->driver('allInPay');

            $rand           = Str::random();
            $params         = ['rand' => $rand];
            $sign           = $pay->sign($params);
            $params['sign'] = $sign;
            $valid          = $pay->valid($params, false);
            if (!$valid) {
                return '请输入正确的公钥和私钥';
            }
        }

        return true;
    }
}