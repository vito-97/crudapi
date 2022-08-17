<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 16:59
 */

namespace app\validate;


class AgentExistsValidate extends BaseValidate
{
    protected $rule = [
//        'agent_id' => 'require|checkHas:agent',
        'agent_id' => 'require',
    ];

    protected $message = [
        'agent_id.checkHas' => '找不到运营商',
    ];
}
