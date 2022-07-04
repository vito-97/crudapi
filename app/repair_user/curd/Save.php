<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 14:02
 */

namespace app\repair_user\curd;


class Save extends \app\common\curd\Save
{
    use AgentScopeTrait;
    protected $userField = 'agent_id';
}