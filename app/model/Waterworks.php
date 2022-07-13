<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\UserScopeTrait;
use app\model\traits\WaterCompanyTrait;
use app\service\WechatService;
use think\Model;

class Waterworks extends User
{
    use UserScopeTrait;

    const USER_TYPE = self::WATERWORKS_TYPE;

    protected $useSiteScope = false;

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

    /**
     * 关联水务公司
     * @return \think\model\relation\BelongsTo
     */
    public function waterCompany()
    {
        return $this->belongsTo('WaterCompany', 'user_id', 'id')->field($this->waterCompanyField ?? 'id,nickname,username,status');
    }
}
