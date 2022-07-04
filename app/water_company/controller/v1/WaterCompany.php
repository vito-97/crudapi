<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/8
 * Time: 15:48
 */

namespace app\water_company\controller\v1;


use app\logic\WaterCompanyLogic;
use app\validate\AgentValidate;
use app\validate\WaterCompanyValidate;
use app\water_company\controller\BaseController;

class WaterCompany extends BaseController
{
    protected $name = '水务公司';

    protected $methodName = [
        'detail' => '详情',
    ];

    protected $agentScope = false;

    protected function initialize()
    {
        $this->logic = new WaterCompanyLogic();
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
        WaterCompanyValidate::batchCheck($param, 'profile');

        $data = WaterCompanyValidate::getDataByRule('profile');

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