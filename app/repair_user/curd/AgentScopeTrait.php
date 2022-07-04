<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:51
 */

namespace app\repair_user\curd;


trait AgentScopeTrait
{
    protected $globalScope = [];

    protected function globalScope()
    {
        return ['agent' => $this->request->user->getUserInfo()->agent_id];
    }
}