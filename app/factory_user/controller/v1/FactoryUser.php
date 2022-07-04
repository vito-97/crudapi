<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 10:28
 */

namespace app\factory_user\controller\v1;

use app\factory_user\controller\BaseController;
use app\logic\FactoryUserLogic;
use app\validate\FactoryUserValidate;

class FactoryUser extends BaseController
{
    protected $name = '出厂设置员';

    protected function initialize()
    {
        $this->logic = new FactoryUserLogic();
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
        FactoryUserValidate::batchCheck($param, 'profile');

        $data = FactoryUserValidate::getDataByRule('profile');

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