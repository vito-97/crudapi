<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 14:03
 */

namespace app\waterworks\curd;


class Update extends \app\common\curd\Update
{
    use AgentScopeTrait;

    protected $userField = 'agent_id';
}