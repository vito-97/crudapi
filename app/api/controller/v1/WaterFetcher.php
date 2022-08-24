<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/9
 * Time: 10:12
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\common\Hash;
use app\exception\IsWaterFetcherException;
use app\exception\MessageException;
use app\logic\WaterFetcherLogic;
use app\validate\WaterFetcherRegisterValidate;
use app\validate\WaterFetcherValidate;

class WaterFetcher extends BaseController
{
    protected function initialize()
    {
        $this->logic = new WaterFetcherLogic();
    }

    public function bind()
    {
        WaterFetcherValidate::batchCheck('bind');

        $params = WaterFetcherValidate::getDataByRule('bind');

        $detail = $this->logic->bindUser($params['username'], $params['password']);

        return $this->success(['detail' => $detail]);
    }

    /**
     * 注册
     * @return array
     * @throws MessageException
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\RegisterErrorException
     * @throws \app\exception\ValidateException
     */
    public function register()
    {
        $data = $this->request->only(['customer_id', 'time']);

        if (!is_dev()) {

            ksort($data);

            $status = Hash::validate(http_build_query($data), $this->request->param('sign'));

            if (!$status) {
                throw new MessageException('签名校验失败');
            }

            $m = 5;

            if ($data['time'] > time() || (time() - $data['time']) >= ($m * 60)) {
                throw new MessageException('请重新扫码进入注册，有效期为' . $m . '分钟');
            }
        }

        WaterFetcherRegisterValidate::batchCheck();

        if ($this->getUserinfo()->type === \app\model\User::WATER_FETCHER_TYPE && !$this->request->param('confirm')) {
            throw new IsWaterFetcherException();
        }

        $params             = WaterFetcherValidate::getDataByRule('register');
        $params['username'] = $params['tel'];
        $params['nickname'] = $params['real_name'];
        $params['user_id']  = $data['customer_id'];

        $user = $this->logic->register($params, \app\model\User::WATER_FETCHER_TYPE);

        $detail = $this->logic->bindUser($params['username'], $params['password']);

        return $this->success(['detail' => $detail]);
    }
}
