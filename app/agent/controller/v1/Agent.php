<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/8
 * Time: 15:48
 */

namespace app\agent\controller\v1;


use app\agent\controller\BaseController;
use app\logic\AgentLogic;
use app\logic\UserLogic;
use app\validate\AgentValidate;

class Agent extends BaseController
{
    protected $name = '运营商';

    protected $methodName = [
        'detail' => '详情',
    ];

    protected $agentScope = false;

    protected function initialize()
    {
        $this->logic = new AgentLogic();
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
        AgentValidate::batchCheck($param, 'profile');

        $data = AgentValidate::getDataByRule('profile');

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
