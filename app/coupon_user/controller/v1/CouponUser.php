<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\coupon_user\controller\v1;

use app\coupon_user\controller\BaseController;
use app\logic\CouponUserLogic;
use app\validate\CouponUserValidate;

class CouponUser extends BaseController
{
    protected $name = '商户';

    protected $userScope = false;

    protected $methodName = [
        'detail' => '详情',
    ];

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new CouponUserLogic();
    }


    /**
     * 获取详情
     * @return array
     */
    public function detail()
    {
        $user = $this->getUserinfo()->scene('api');

        $response = [
            'detail' => $user,
        ];

        return success($response);
    }

    /**
     * 修改个人信息
     * @return array
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ValidateException
     */
    public function profile()
    {
        $param       = $this->request->post();
        $param['id'] = $this->uid();

        CouponUserValidate::batchCheck($param, 'profile');

        $data = CouponUserValidate::getDataByRule('profile');

        foreach ($data as $key => $val) {
            if (!$val) {
                unset($data[$key]);
            }
        }

        $user = $this->getUserinfo()->scene('api');

        $user->save($data);

        $response = [
            'detail' => $user,
        ];

        return success($response);
    }
}
