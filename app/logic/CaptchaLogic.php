<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\model\BaseModel;
use app\service\CaptchaService;
use app\validate\CaptchaValidate;
use think\facade\App;

class CaptchaLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return BaseModel::class;
    }

    public function verify($key = '', $config = null)
    {
        if (!$key) {
            $key = $this->request->param('key');
        }

        CaptchaValidate::batchCheck(['key' => $key], 'show');

        $captcha  = App::getInstance()->invokeClass(CaptchaService::class, [$key]);
        $response = $captcha->create($config);

        $response->getContent();

        return $response;
    }
}
