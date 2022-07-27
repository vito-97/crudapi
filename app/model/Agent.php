<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:27
 */

namespace app\model;


use app\model\traits\UserScopeTrait;
use app\service\WechatService;
use think\Model;

class Agent extends User
{
    use UserScopeTrait;

    const USER_TYPE = self::AGENT_TYPE;

    protected $productTypeEnum = Product::TYPE_ENUM;

    protected $scene = [
        'api' => [
            'visible' => ['id', 'nickname', 'username', 'extend', 'real_name', 'phone', 'tel', 'avatar', 'email', 'product_type', 'last_login_ip', 'last_login_time', 'create_time'],
        ],
    ];

    public static function onAfterWrite(Model $model): void
    {
        self::createRepairRegisterQrcode($model);
    }

    public static function createRepairRegisterQrcode($model)
    {
        if (!$model->extend || empty($model->extend['repair_register_qrcode'])) {
            $wechat = new WechatService();

            $result = $wechat->qrcode->forever('repair_register_' . $model->id);
            if (isset($result['url'])) {
                if (!$model->extend) {
                    $model->extend = [];
                }
                $extend                           = $model->extend;
                $extend['repair_register_url']    = $result['url'];
                $extend['repair_register_qrcode'] = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . $result['ticket'];
                $model->extend                    = $extend;
                return $model->save();
            } else {
                return false;
            }
        }

        return true;
    }
}
