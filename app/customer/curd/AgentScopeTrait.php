<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 11:51
 */

namespace app\customer\curd;


trait AgentScopeTrait
{
    protected $globalScope = [];

    protected function globalScope()
    {
//        return ['agent' => $this->request->user->uid()];
    }
}