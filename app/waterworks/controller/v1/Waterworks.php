<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/8
 * Time: 15:48
 */

namespace app\waterworks\controller\v1;

use app\logic\WaterworksLogic;
use app\validate\WaterworksValidate;
use app\waterworks\controller\BaseController;

class Waterworks extends BaseController
{
    protected $name = '水厂';

    protected $methodName = [
        'detail' => '详情',
    ];

    protected $agentScope = false;

    protected function initialize()
    {
        $this->logic = new WaterworksLogic();
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
        WaterworksValidate::batchCheck($param, 'profile');

        $data = WaterworksValidate::getDataByRule('profile');

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