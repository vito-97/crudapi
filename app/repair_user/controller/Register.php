<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 16:54
 */

namespace app\repair_user\controller;


use app\common\ErrorCode;
use app\logic\RepairUserLogic;
use app\model\Member;
use app\model\User;
use app\validate\AgentExistsValidate;
use app\validate\CaptchaValidate;
use app\validate\RegisterValidate;

class Register extends BaseController
{
    protected $name = '注册';

    protected $agentScope = false;

    const NOT_NEED_LOGIN = ['index'];

    protected $methodName = [
        'index' => '注册',
    ];

    protected function initialize()
    {
        $this->logic = new RepairUserLogic();
    }

    /**
     * 注册
     * @return array|mixed
     * @throws \app\exception\ValidateException
     */
    public function index()
    {
        AgentExistsValidate::batchCheck();
        CaptchaValidate::batchCheck();

        $params = $this->request->only(['agent_id', 'username', 'password', 'avatar', 'tel', 'nickname']);
        $agent  = Member::where('type', 'IN', [User::AGENT_TYPE, User::WATERWORKS_TYPE])->find($params['agent_id']);

        if (!$agent) {
            return $this->error(ErrorCode::DATA_NOT_FOUND, '没有找到运营商');
        }

        if (empty($params['username'])) {
            $params['username'] = $params['tel'] ?? '';
        }
        $params['status'] = User::STATUS_OFF;
        $params['mark']   = '申请注册';

        $user = $this->logic->register($params, User::REPAIR_TYPE);

        return $this->success([], '注册成功，请等待通过审核');
    }
}
