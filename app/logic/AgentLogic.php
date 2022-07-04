<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:33
 */

namespace app\logic;


use app\model\Agent;

class AgentLogic extends UserLogic
{
    protected function getModelName()
    {
        return Agent::class;
    }
}